import 'package:json_annotation/json_annotation.dart';

part 'sbus.g.dart';

@JsonSerializable()
class Sbus {
  @JsonKey(name: "logo")
  String? logo;
  @JsonKey(name: "banner")
  String? banner;
  @JsonKey(name: "sbuTag")
  String? sbuTag;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "shortName")
  String? shortName;
  @JsonKey(name: "brandColor")
  String? brandColor;

  Sbus({
    this.logo,
    this.banner,
    this.sbuTag,
    this.status,
    this.id,
    this.fullName,
    this.shortName,
    this.brandColor,
  });

  Sbus copyWith({
    String? logo,
    String? banner,
    String? sbuTag,
    bool? status,
    String? id,
    String? fullName,
    String? shortName,
    String? brandColor,
  }) =>
      Sbus(
        logo: logo ?? this.logo,
        banner: banner ?? this.banner,
        sbuTag: sbuTag ?? this.sbuTag,
        status: status ?? this.status,
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        shortName: shortName ?? this.shortName,
        brandColor: brandColor ?? this.brandColor,
      );

  factory Sbus.fromJson(Map<String, dynamic> json) => _$SbusFromJson(json);

  Map<String, dynamic> toJson() => _$SbusToJson(this);
}