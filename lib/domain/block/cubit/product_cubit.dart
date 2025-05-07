import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/models/product_response.dart';
import 'package:robosoftassignment/data/repositories/product_crud_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';

final product = ProductResponse(
  id: 0,
  name: 'Book',
  price: 1.1,
  description: 'sample',
);
class ProductCubit extends Cubit<ApiState> {
  final ProductCrudRepository _productRepository;
  ProductCubit(this._productRepository) : super(ApiInitial());

  void addProduct() async {
    emit(ApiLoading());
    
    try {
      final token = await _productRepository.addProduct(product.toJson());
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Adding Product has failed"));
    }
  }

  void getProductsList() async{
    emit(ApiLoading());

     try {
      final token = await _productRepository.getProductsList();
      emit(ApiSuccess(token));
    } catch (e) {
      emit(ApiFailure("Adding Product has failed"));
    }
  }
}