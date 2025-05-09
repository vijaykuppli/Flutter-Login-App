// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductResponseImpl _$$ProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductResponseImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  description: json['description'] as String? ?? "",
  image: json['image'] as String? ?? "",
  category: json['category'] as String? ?? "",
);

Map<String, dynamic> _$$ProductResponseImplToJson(
  _$ProductResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'image': instance.image,
  'category': instance.category,
};
