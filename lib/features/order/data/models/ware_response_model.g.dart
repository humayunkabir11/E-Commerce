// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ware_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareHouseResposeModel _$WareHouseResposeModelFromJson(
        Map<String, dynamic> json) =>
    WareHouseResposeModel(
      status: json['status'] as String?,
      totalLength: (json['totalLength'] as num?)?.toInt(),
      currentLength: (json['currentLength'] as num?)?.toInt(),
      warehouses: (json['warehouses'] as List<dynamic>?)
          ?.map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WareHouseResposeModelToJson(
        WareHouseResposeModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalLength': instance.totalLength,
      'currentLength': instance.currentLength,
      'warehouses': instance.warehouses,
    };
