import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @Default(0)
    int id,
    @Default("")
    String title,
    @Default(0.0)
    double price,
    @Default("")
    String description,
    @Default("")
    String image,
    @Default("")
    String category
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String , dynamic> json) =>
      _$ProductResponseFromJson(json);
}