import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:robosoftassignment/data/models/cart/cart_product_item.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    required int id,
    required int userId,
    required List<CartProductItem> products,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
