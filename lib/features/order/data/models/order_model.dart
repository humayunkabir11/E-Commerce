import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/order.dart';


part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Order {

  String? name;
  OrderModel(this.name,);





  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}