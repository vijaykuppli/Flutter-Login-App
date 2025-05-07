import 'package:robosoftassignment/data/repositories/interceptor/dio_interceptor.dart';

class ProductCrudRepository {
  final DioInterceptor _dio = DioInterceptor();

  Future<String> addProduct(Map<String, dynamic> json) async {
    final response = await _dio.dio.post("products", data: json);
    return response.data['description'];
  }
}
