// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      status: json['status'] as String?,
      totalLength: (json['totalLength'] as num?)?.toInt(),
      currentLength: (json['currentLength'] as num?)?.toInt(),
      slides: (json['slides'] as List<dynamic>?)
          ?.map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalLength': instance.totalLength,
      'currentLength': instance.currentLength,
      'slides': instance.slides,
    };
