import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/repositories/interceptor/dio_interceptor.dart';

class CartRepository {
  final DioInterceptor _dio = DioInterceptor();

  Future<List<ProductResponse>> getCartItemsList() async {
    final response = await _dio.dio.get("products");
    final List<dynamic> jsonList = response.data;

    final List<ProductResponse> products =
        jsonList
            .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
            .toList();
    return products;
  }
}
