// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      status: json['status'] as bool?,
      id: json['_id'] as String?,
      sbuId: json['sbuId'] == null
          ? null
          : SbuId.fromJson(json['sbuId'] as Map<String, dynamic>),
      title: json['title'] as String?,
      details: json['details'] as String?,
      sorting: json['sorting'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'sbuId': instance.sbuId,
      'title': instance.title,
      'details': instance.details,
      'sorting': instance.sorting,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
