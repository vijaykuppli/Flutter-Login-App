import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/repositories/product_crud_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ApiState> {
  final ProductCrudRepository productCrudRepository;
  ProductBloc(this.productCrudRepository) : super(ApiInitial()) {
    on<GetProductDataEvent>((event, emit) async {
      emit(ApiLoading());

      try {
        final token = await productCrudRepository.getProductsList();
        emit(ApiSuccess(token));
      } catch (exception) {
        emit(ApiFailure('api failed $exception'));
      }
    });
  }
}
