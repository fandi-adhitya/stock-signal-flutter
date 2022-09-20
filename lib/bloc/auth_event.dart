part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}
class GoToAuthCheck extends AuthEvent{
  final Auth auth;
  GoToAuthCheck(this.auth);
  @override
  List<Object> get props => [auth];
}

class GoToAuthSuccess extends AuthEvent{
  @override
  List<Object> get props => [];
}

class GoToAuthFail extends AuthEvent{
  @override
  List<Object> get props => [];
}


class GoToAuthRegister extends AuthEvent{
  final AuthRegisterM register;
  GoToAuthRegister(this.register);
  @override
  List<Object> get props => [register];
}

class GoToLogout extends AuthEvent {
  @override
  List<Object> get props => [];
}





