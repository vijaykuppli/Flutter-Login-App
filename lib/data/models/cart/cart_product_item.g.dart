// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductItemImpl _$$CartProductItemImplFromJson(
  Map<String, dynamic> json,
) => _$CartProductItemImpl(
  productId: (json['productId'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$$CartProductItemImplToJson(
  _$CartProductItemImpl instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
