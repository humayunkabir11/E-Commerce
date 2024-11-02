import 'package:json_annotation/json_annotation.dart';

import '../../../order/data/models/sbuid_model.dart';


part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "sbuId")
  final SbuId? sbuId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "sorting")
  final String? sorting;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  SliderModel({
    this.status,
    this.id,
    this.sbuId,
    this.title,
    this.details,
    this.sorting,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  SliderModel copyWith({
    bool? status,
    String? id,
    SbuId? sbuId,
    String? title,
    String? details,
    String? sorting,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      SliderModel(
        status: status ?? this.status,
        id: id ?? this.id,
        sbuId: sbuId ?? this.sbuId,
        title: title ?? this.title,
        details: details ?? this.details,
        sorting: sorting ?? this.sorting,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
