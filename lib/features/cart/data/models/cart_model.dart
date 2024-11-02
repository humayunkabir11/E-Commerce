import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/cart.dart';


part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends Cart {

  String? name;
  CartModel(this.name,);





  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}