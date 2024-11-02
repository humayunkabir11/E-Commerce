import 'package:json_annotation/json_annotation.dart';

part 'order_history_response.g.dart';

@JsonSerializable()
class OrderHistoryResponse{

  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  OrderHistoryResponse(this.status, this.message);

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) => _$OrderHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryResponseToJson(this);
}