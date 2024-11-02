// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Division _$DivisionFromJson(Map<String, dynamic> json) => Division(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DivisionToJson(Division instance) => <String, dynamic>{
      'location': instance.location,
      'status': instance.status,
      '_id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
