import 'package:robosoftassignment/data/models/product_response.dart';
import 'package:robosoftassignment/data/repositories/interceptor/dio_interceptor.dart';
import 'package:robosoftassignment/domain/models/product_request.dart';

final product = ProductResponse(
  id: '1',
  name: 'Book',
  price: 1.1,
  description: 'sample',
);

class ProductCrudRepository {
  final DioInterceptor _dio = DioInterceptor();

  Future<String> addProduct(ProductRequest productRequest) async {
    final response = await _dio.dio.post("products", data: product.toJson());
    return response.data['id'];
  }
}
