sealed class ApiState {}
class ApiInitial extends ApiState {}
class ApiLoading extends ApiState {}
class ApiSuccess<T> extends ApiState {
  final T token;
  ApiSuccess(this.token);
}
class ApiFailure extends ApiState {
  final String message;
  ApiFailure(this.message);
}