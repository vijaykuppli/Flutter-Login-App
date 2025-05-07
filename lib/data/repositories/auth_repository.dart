import 'package:robosoftassignment/data/repositories/interceptor/dio_interceptor.dart';

class AuthRepository {
  final DioInterceptor _dio = DioInterceptor();

  Future<String> login(String email, String password) async {
    final response = await _dio.dio.post(
      "auth/login",
      data: {'username': email, 'password': password},
    );
    return response.data['token'];
  }

  Future<String> signup(String email, String password) async {
    final response = await _dio.dio.post(
      'users',
      data: {
        'id': 0,
        'username': "Vijay",
        'email': email,
        'password': password,
      },
    );
    return response.data['id'].toString();
  }
}
