part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthState {
  final Auth auth;
  AuthLogin(this.auth);
  List<Object> get props => [auth];
}

class AuthSuccess extends AuthState {
    List<Object> get props => [];
}

class AuthFail extends AuthState {
  final String message;
  AuthFail(this.message);
  List<Object> get props => [];
}


class AuthLogout extends AuthState {
  @override
  List<Object> get props => [];
}


class AuthRegister extends AuthState {
  final AuthRegisterM authRegister;
  AuthRegister(this.authRegister);
  List<Object> get props => [authRegister];
}

class AuthSuccessRegister extends AuthState{
  final String message;
  AuthSuccessRegister(this.message);
  @override
  List<Object> get props => [];
}

class AuthFailRegister extends AuthState {
  final String message;
  AuthFailRegister(this.message);
  List<Object> get props => [];
}