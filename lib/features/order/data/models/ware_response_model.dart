import 'package:aji/features/order/data/models/product_model.dart';
import 'package:aji/features/order/data/models/ware_house_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ware_response_model.g.dart';

@JsonSerializable()
class WareHouseResposeModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalLength")
  int? totalLength;
  @JsonKey(name: "currentLength")
  int? currentLength;
  @JsonKey(name: "warehouses")
  List<Warehouse>? warehouses;

  WareHouseResposeModel({
    this.status,
    this.totalLength,
    this.currentLength,
    this.warehouses,
  });

  factory WareHouseResposeModel.fromJson(Map<String, dynamic> json) => _$WareHouseResposeModelFromJson(json);

  Map<String, dynamic> toJson() => _$WareHouseResposeModelToJson(this);
}
