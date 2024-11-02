// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      status: json['status'] as String?,
      getData: json['getData'] == null
          ? null
          : User.fromJson(json['getData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'getData': instance.getData,
    };
