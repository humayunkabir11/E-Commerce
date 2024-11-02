// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ware_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => Warehouse(
      status: json['status'] as bool?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      regionId: json['regionId'] == null
          ? null
          : WareId.fromJson(json['regionId'] as Map<String, dynamic>),
      areaId: json['areaId'] == null
          ? null
          : WareId.fromJson(json['areaId'] as Map<String, dynamic>),
      address: json['address'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'name': instance.name,
      'regionId': instance.regionId,
      'areaId': instance.areaId,
      'address': instance.address,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
