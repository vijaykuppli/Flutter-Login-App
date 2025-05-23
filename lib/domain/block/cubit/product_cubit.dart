import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/models/product/product_response.dart';
import 'package:robosoftassignment/data/repositories/product_crud_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';

class ProductCubit extends Cubit<ApiState> {
  final ProductCrudRepository _productRepository;
  ProductCubit(this._productRepository) : super(ApiInitial());

  void addProduct(ProductResponse productResponse) async {
    emit(ApiLoading());

    try {
      final token = await _productRepository.addProduct(
        productResponse.toJson(),
      );
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Adding Product has failed"));
    }
  }

  void getProductsList() async {
    emit(ApiLoading());

    try {
      final token = await _productRepository.getProductsList();
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Adding Product has failed"));
    }
  }

  void deleteProduct(int userId) async {
    emit(ApiLoading());

    try {
      await _productRepository.deleteProduct(userId);

      final getProductsList = await _productRepository.getProductsList();
      emit(ApiSuccess(getProductsList));
    } catch (e) {
      emit(ApiFailure("Adding Product has failed"));
    }
  }
}
