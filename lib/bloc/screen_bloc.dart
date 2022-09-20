import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(ScreenInitial()) {
    on<ScreenEvent>((event, emit) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString("token");
      print(token);
      if(event is GoToSplashScreen)  {
        emit(OnSplashScreen());
        await Future.delayed(Duration(seconds: 2));
        if(token == null) {
          emit(OnLoginScreen());
        } else {
          await UserServices().checkAuthentication().then((value){
            // print(value);
            value == true ? emit(OnMainScreen()) : emit(OnLoginScreen());
          });
          // print(check!.message.toString());
          // AuthCheck? check = await UserServices().checkAuthentication();
          // if(check!.success != null) {
          //   if(check.success == true){
          //     emit(OnMainScreen());
          //   } else {
          //     emit(OnLoginScreen());
          //   }
          // } else {
          //   emit(OnLoginScreen());
          // }
        }
      } else if(event is GoToMainScreen){
        emit(OnMainScreen());
      }
    });
  }
}
