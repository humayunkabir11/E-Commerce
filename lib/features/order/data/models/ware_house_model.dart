import 'package:aji/features/order/data/models/product_model.dart';
import 'package:aji/features/order/data/models/ware_id.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ware_house_model.g.dart';

@JsonSerializable()
@JsonSerializable()
class Warehouse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "regionId")
  WareId? regionId;
  @JsonKey(name: "areaId")
  WareId? areaId;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Warehouse({
    this.status,
    this.id,
    this.name,
    this.regionId,
    this.areaId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  String toString() {
    return 'DivisionModel{id: $id, name: $name}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Warehouse &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;


  @override
  int get hashCode => id.hashCode ^ name.hashCode;


  factory Warehouse.fromJson(Map<String, dynamic> json) => _$WarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}

