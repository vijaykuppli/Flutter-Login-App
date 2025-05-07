import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:robosoftassignment/data/models/product_response.dart';
import 'package:robosoftassignment/data/repositories/interceptor/dio_interceptor.dart';

class ProductCrudRepository {
  final DioInterceptor _dio = DioInterceptor();

  Future<String> addProduct(Map<String, dynamic> json) async {
    final response = await _dio.dio.post("products", data: json);
    return response.data['description'];
  }

  Future<List<ProductResponse>> getProductsList() async {
    final response = await _dio.dio.get("products");
    final List<dynamic> jsonList =
        response.data; // or jsonDecode(response.body)

    final List<ProductResponse> products =
        jsonList
            .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
            .toList();
    return products;
  }
}
