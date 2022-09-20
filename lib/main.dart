import 'package:fawz_apps/bloc/summary_trade_bloc.dart';
import 'package:fawz_apps/screens/screens.dart';
import 'package:fawz_apps/services/notification_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:fawz_apps/bloc/blocs.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late AppleNotification ioschannel;
late IOSInitializationSettings init;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService().setupInteractedMessage();
  // await Firebase.initializeApp(
  // options: const FirebaseOptions(
  //   apiKey: 'AIzaSyBLT7mDdhwGSsAWuTAm0DDC-K6zJPwGjW0',
  //   appId: '1:821531742077:android:da769a85af9f8d99120614',
  //   messagingSenderId: '821531742077',
  //   projectId: 'fawz-apps',
  // ),
  // );

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController? pageController;

  Future<void> subscribeAllNotif() async {
    await FirebaseMessaging.instance
        .subscribeToTopic('news')
        .then((value) => print("news has subsribe"));
    await FirebaseMessaging.instance
        .subscribeToTopic('signal')
        .then((value) => print("signal has subsribe"));
    await FirebaseMessaging.instance
        .subscribeToTopic('update')
        .then((value) => print("signal update has subsribe"));

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  void initState() {
    subscribeAllNotif();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // IOSFlutterLocalNotificationsPlugin ios = message.notification.apple;
      if (notification != null && android != null && !kIsWeb) {
        var iOSPlatformChannelSpecifics = new IOSNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@mipmap/ic_launcher',
              ),
              iOS: iOSPlatformChannelSpecifics),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("background message from fcm");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: null,
      initialData: null,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ScreenBloc()..add(GoToSplashScreen())),
            BlocProvider(create: (_) => AuthBloc()),
            BlocProvider(create: (_) => SignalBloc()..add(FetchSignal())),
            BlocProvider(create: (_) => NewsBloc()),
            BlocProvider(
                create: (_) => SummaryTradeBloc()..add(FetchSummaryTrade()))
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
            routes: {"/login": (context) => LoginScreen()},
          )),
    );
  }
}
