import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "coordinates")
  List<double>? coordinates;

  LocationModel({
    this.type,
    this.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}