
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robosoftassignment/data/repositories/cart_repository.dart';
import 'package:robosoftassignment/domain/block/auth_state.dart';
import 'package:robosoftassignment/domain/block/cart_event.dart';

class CartBloc extends Bloc<CartEvent, ApiState> {
  final CartRepository cartRepository;
  CartBloc(this.cartRepository) : super(ApiInitial()) {
    on<CartEvent>((event, emit) async {
      emit(ApiLoading());

      try {
        final token = await cartRepository.getCartItemsList();
        emit(ApiSuccess(token));
      } catch (exception) {
        emit(ApiFailure('api failed $exception'));
      }
    });
  }
}