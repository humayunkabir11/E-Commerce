// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryResponse _$OrderHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    OrderHistoryResponse(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$OrderHistoryResponseToJson(
        OrderHistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
