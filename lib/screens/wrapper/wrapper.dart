part of '../screens.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
        builder: (BuildContext _, pageState) => 
        (pageState is OnLoginScreen) ? LoginScreen() :
        (pageState is OnMainScreen) ? MainScreen() : SplashScreen());
  }
}
