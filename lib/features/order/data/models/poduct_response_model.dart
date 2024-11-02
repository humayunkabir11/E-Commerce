import 'package:aji/features/order/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poduct_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalLength")
  final int? totalLength;
  @JsonKey(name: "currentLength")
  final int? currentLength;
  @JsonKey(name: "products")
  final List<Product>? products;

  ProductResponseModel({
    this.status,
    this.totalLength,
    this.currentLength,
    this.products,
  });

  ProductResponseModel copyWith({
    String? status,
    int? totalLength,
    int? currentLength,
    List<Product>? products,
  }) =>
      ProductResponseModel(
        status: status ?? this.status,
        totalLength: totalLength ?? this.totalLength,
        currentLength: currentLength ?? this.currentLength,
        products: products ?? this.products,
      );

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}
