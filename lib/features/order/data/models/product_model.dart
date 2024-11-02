import 'package:aji/features/order/data/models/sbuid_model.dart';
import 'package:aji/features/order/data/models/unitid_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_id_model.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1) // Define a unique typeId for the class
@JsonSerializable()
class Product  extends HiveObject{
  @HiveField(0)
  @JsonKey(name: "status")
  final String? status;

  @HiveField(1)
  @JsonKey(name: "_id")
  final String? id;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(3)
  @JsonKey(name: "code")
  final String? code;

  @HiveField(4)
  @JsonKey(name: "sbuId")
  final SbuId? sbuId;

  @HiveField(5)
  @JsonKey(name: "categoryId")
  final CategoryId? categoryId;

  @HiveField(6)
  @JsonKey(name: "subCategoryId")
  final CategoryId? subCategoryId;

  @HiveField(7)
  @JsonKey(name: "unitId")
  final UnitId? unitId;

  @HiveField(8)
  @JsonKey(name: "regularPrice")
  final num? regularPrice;

  @HiveField(9)
  @JsonKey(name: "offerPrice")
  final num? offerPrice;

  @HiveField(10)
  @JsonKey(name: "declaredPrice")
  final num? declaredPrice;

  @HiveField(11)
  @JsonKey(name: "stockQuantity")
  final num? stockQuantity;

  @HiveField(12)
  @JsonKey(name: "weight")
  final String? weight;

  @HiveField(13)
  @JsonKey(name: "rft")
  final String? rft;

  @HiveField(14)
  @JsonKey(name: "description")
  final String? description;

  @HiveField(15)
  @JsonKey(name: "orderNote")
  final String? orderNote;

  @HiveField(16)
  @JsonKey(name: "image")
  final String? image;

  @HiveField(17)
  @JsonKey(name: "productLog")
  final List<dynamic>? productLog;

  @HiveField(18)
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  @HiveField(19)
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  @HiveField(20)
  @JsonKey(name: "__v")
  final num? v;

  Product({
    this.status,
    this.id,
    this.name,
    this.code,
    this.sbuId,
    this.categoryId,
    this.subCategoryId,
    this.unitId,
    this.regularPrice,
    this.offerPrice,
    this.declaredPrice,
    this.stockQuantity,
    this.weight,
    this.rft,
    this.description,
    this.orderNote,
    this.image,
    this.productLog,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Product copyWith({
    String? status,
    String? id,
    String? name,
    String? code,
    SbuId? sbuId,
    CategoryId? categoryId,
    CategoryId? subCategoryId,
    UnitId? unitId,
    num? regularPrice,
    num? offerPrice,
    num? declaredPrice,
    num? stockQuantity,
    String? weight,
    String? rft,
    String? description,
    String? orderNote,
    String? image,
    List<dynamic>? productLog,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? v,
  }) =>
      Product(
        status: status ?? this.status,
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        sbuId: sbuId ?? this.sbuId,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        unitId: unitId ?? this.unitId,
        regularPrice: regularPrice ?? this.regularPrice,
        offerPrice: offerPrice ?? this.offerPrice,
        declaredPrice: declaredPrice ?? this.declaredPrice,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        weight: weight ?? this.weight,
        rft: rft ?? this.rft,
        description: description ?? this.description,
        orderNote: orderNote ?? this.orderNote,
        image: image ?? this.image,
        productLog: productLog ?? this.productLog,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
