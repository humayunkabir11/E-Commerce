// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      status: fields[0] as String?,
      id: fields[1] as String?,
      name: fields[2] as String?,
      code: fields[3] as String?,
      sbuId: fields[4] as SbuId?,
      categoryId: fields[5] as CategoryId?,
      subCategoryId: fields[6] as CategoryId?,
      unitId: fields[7] as UnitId?,
      regularPrice: fields[8] as num?,
      offerPrice: fields[9] as num?,
      declaredPrice: fields[10] as num?,
      stockQuantity: fields[11] as num?,
      weight: fields[12] as String?,
      rft: fields[13] as String?,
      description: fields[14] as String?,
      orderNote: fields[15] as String?,
      image: fields[16] as String?,
      productLog: (fields[17] as List?)?.cast<dynamic>(),
      createdAt: fields[18] as DateTime?,
      updatedAt: fields[19] as DateTime?,
      v: fields[20] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.sbuId)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.subCategoryId)
      ..writeByte(7)
      ..write(obj.unitId)
      ..writeByte(8)
      ..write(obj.regularPrice)
      ..writeByte(9)
      ..write(obj.offerPrice)
      ..writeByte(10)
      ..write(obj.declaredPrice)
      ..writeByte(11)
      ..write(obj.stockQuantity)
      ..writeByte(12)
      ..write(obj.weight)
      ..writeByte(13)
      ..write(obj.rft)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.orderNote)
      ..writeByte(16)
      ..write(obj.image)
      ..writeByte(17)
      ..write(obj.productLog)
      ..writeByte(18)
      ..write(obj.createdAt)
      ..writeByte(19)
      ..write(obj.updatedAt)
      ..writeByte(20)
      ..write(obj.v);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      status: json['status'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      sbuId: json['sbuId'] == null
          ? null
          : SbuId.fromJson(json['sbuId'] as Map<String, dynamic>),
      categoryId: json['categoryId'] == null
          ? null
          : CategoryId.fromJson(json['categoryId'] as Map<String, dynamic>),
      subCategoryId: json['subCategoryId'] == null
          ? null
          : CategoryId.fromJson(json['subCategoryId'] as Map<String, dynamic>),
      unitId: json['unitId'] == null
          ? null
          : UnitId.fromJson(json['unitId'] as Map<String, dynamic>),
      regularPrice: json['regularPrice'] as num?,
      offerPrice: json['offerPrice'] as num?,
      declaredPrice: json['declaredPrice'] as num?,
      stockQuantity: json['stockQuantity'] as num?,
      weight: json['weight'] as String?,
      rft: json['rft'] as String?,
      description: json['description'] as String?,
      orderNote: json['orderNote'] as String?,
      image: json['image'] as String?,
      productLog: json['productLog'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as num?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'sbuId': instance.sbuId,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'unitId': instance.unitId,
      'regularPrice': instance.regularPrice,
      'offerPrice': instance.offerPrice,
      'declaredPrice': instance.declaredPrice,
      'stockQuantity': instance.stockQuantity,
      'weight': instance.weight,
      'rft': instance.rft,
      'description': instance.description,
      'orderNote': instance.orderNote,
      'image': instance.image,
      'productLog': instance.productLog,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
