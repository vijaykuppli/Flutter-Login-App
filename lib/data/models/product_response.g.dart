// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductResponseImpl _$$ProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductResponseImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  description: json['description'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$$ProductResponseImplToJson(
  _$ProductResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'description': instance.description,
  'image': instance.image,
};
