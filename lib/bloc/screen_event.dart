part of 'screen_bloc.dart';

abstract class ScreenEvent extends Equatable {
  const ScreenEvent();
}

class GoToSplashScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToMainScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}
