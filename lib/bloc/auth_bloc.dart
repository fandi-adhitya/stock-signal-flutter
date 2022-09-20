import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      emit(AuthInitial());
      if(event is GoToAuthCheck){
        AuthResult? result = await AuthServices().login(event.auth);
        if(result!.success == false){
          emit(AuthInitial());
          emit(AuthFail(result.message.toString()));
        }
        else {
          sharedPreferences.setString("token", result.data!.token.toString());
          emit(AuthSuccess()); 
        }
      }

      if(event is GoToLogout){
        var response = await AuthServices().logout();
        if(response.status == "success"){
          await sharedPreferences.clear();
          emit(AuthLogout());
        }
      }

      if(event is GoToAuthRegister){
        var response = await AuthServices().register(event.register);
        if(response.success == false) {
          emit(AuthInitial());
          emit(AuthFailRegister("failed to register, member is available"));
        } else {
          emit(AuthSuccessRegister("Please login"));
        }
      }
    });
  }
}
