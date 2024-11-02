import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../Data/Location/location/location_model.dart';


part 'division_model.g.dart';


@JsonSerializable()
class Division {
  @JsonKey(name: "location")
  LocationModel? location;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Division({
    this.location,
    this.status,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Division.fromJson(Map<String, dynamic> json) => _$DivisionFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionToJson(this);
}