import 'package:dio/dio.dart';
import 'package:logger/web.dart';

class DioInterceptor {
  Dio dio = Dio();
  Logger logger = Logger();

  DioInterceptor()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://fakestoreapi.com/', // ✅ Set your base URL here
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
          logger.i('Headers: ${options.headers}');
          logger.i('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          logger.i('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e(
            'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
          );
          logger.e('Message: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }
}
