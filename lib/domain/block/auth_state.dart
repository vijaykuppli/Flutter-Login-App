import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/repositories/auth_repository.dart';

sealed class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess(this.token);
}
class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      final token = await _repository.login(email, password);
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure("Login failed"));
    }
  }
  void signUp(String email, String password) async {
    emit(LoginLoading());
    try {
      final token = await _repository.signup(email, password);
      emit(LoginSuccess(token));
    } catch (e) {
      emit(LoginFailure("Signup failed"));
    }
  }
}