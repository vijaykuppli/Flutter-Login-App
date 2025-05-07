import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/domain/block/auth_event.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, ApiState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(ApiInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(ApiLoading());

      try {
        final token = await authRepository.login(event.email, event.password);
        emit(ApiSuccess('login Successful $token'));
      } catch (exception) {
        emit(ApiFailure('login failed $exception'));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(ApiLoading());
      try {
        final msg = await authRepository.signup(event.email, event.password);
        emit(ApiSuccess('Signup successful: $msg'));
      } catch (e) {
        emit(ApiFailure('Signup failed: ${e.toString()}'));
      }
    });
  }
}
