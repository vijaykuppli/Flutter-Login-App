import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/domain/block/auth_event.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, LoginState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());

      try {
        final token = await authRepository.login(event.email, event.password);
        emit(LoginSuccess('login Successful $token'));
      } catch (exception) {
        emit(LoginFailure('login failed $exception'));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final msg = await authRepository.signup(event.email, event.password);
        emit(LoginSuccess('Signup successful: $msg'));
      } catch (e) {
        emit(LoginFailure('Signup failed: ${e.toString()}'));
      }
    });
  }
}
