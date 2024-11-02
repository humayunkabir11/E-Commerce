// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['findUser'] == null
          ? null
          : User.fromJson(json['findUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'findUser': instance.user,
    };
