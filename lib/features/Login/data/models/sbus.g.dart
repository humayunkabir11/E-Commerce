// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sbus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sbus _$SbusFromJson(Map<String, dynamic> json) => Sbus(
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      sbuTag: json['sbuTag'] as String?,
      status: json['status'] as bool?,
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      shortName: json['shortName'] as String?,
      brandColor: json['brandColor'] as String?,
    );

Map<String, dynamic> _$SbusToJson(Sbus instance) => <String, dynamic>{
      'logo': instance.logo,
      'banner': instance.banner,
      'sbuTag': instance.sbuTag,
      'status': instance.status,
      '_id': instance.id,
      'fullName': instance.fullName,
      'shortName': instance.shortName,
      'brandColor': instance.brandColor,
    };
