import 'package:aji/features/order/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ware_id.g.dart';

@JsonSerializable()
class WareId {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  WareId({
    this.id,
    this.name,
  });

  factory WareId.fromJson(Map<String, dynamic> json) => _$WareIdFromJson(json);

  Map<String, dynamic> toJson() => _$WareIdToJson(this);
}