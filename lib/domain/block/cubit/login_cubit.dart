import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/repositories/auth_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';

class LoginCubit extends Cubit<ApiState> {
  final AuthRepository _repository;
  LoginCubit(this._repository) : super(ApiInitial());

  void login(String email, String password) async {
    emit(ApiLoading());
    try {
      final token = await _repository.login(email, password);
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Login failed"));
    }
  }
  void signUp(String email, String password) async {
    emit(ApiLoading());
    try {
      final token = await _repository.signup(email, password);
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Signup failed"));
    }
  }
}