
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_item.freezed.dart';
part 'cart_product_item.g.dart';
@freezed
class CartProductItem with _$CartProductItem {
  const factory CartProductItem({
    required int productId,
    required int quantity,
  }) = _CartProductItem;

  factory CartProductItem.fromJson(Map<String, dynamic> json) => _$CartProductItemFromJson(json);
}