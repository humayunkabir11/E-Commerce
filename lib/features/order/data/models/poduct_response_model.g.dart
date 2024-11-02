// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poduct_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      status: json['status'] as String?,
      totalLength: (json['totalLength'] as num?)?.toInt(),
      currentLength: (json['currentLength'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalLength': instance.totalLength,
      'currentLength': instance.currentLength,
      'products': instance.products,
    };
