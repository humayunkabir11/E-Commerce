// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sbu_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SbuResposeModel _$SbuResposeModelFromJson(Map<String, dynamic> json) =>
    SbuResposeModel(
      status: json['status'] as String?,
      totalLength: (json['totalLength'] as num?)?.toInt(),
      currentLength: (json['currentLength'] as num?)?.toInt(),
      divisions: (json['divisions'] as List<dynamic>?)
          ?.map((e) => Division.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SbuResposeModelToJson(SbuResposeModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalLength': instance.totalLength,
      'currentLength': instance.currentLength,
      'divisions': instance.divisions,
    };
