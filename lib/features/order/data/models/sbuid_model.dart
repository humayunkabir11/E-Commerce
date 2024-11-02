import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sbuid_model.g.dart';

@HiveType(typeId: 2) // Define a unique typeId for the SbuId class
@JsonSerializable()
class SbuId {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;

  @HiveField(1)
  @JsonKey(name: "fullName")
  final String? fullName;

  @HiveField(2)
  @JsonKey(name: "shortName")
  final String? shortName;

  SbuId({
    this.id,
    this.fullName,
    this.shortName,
  });

  SbuId copyWith({
    String? id,
    String? fullName,
    String? shortName,
  }) =>
      SbuId(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        shortName: shortName ?? this.shortName,
      );

  factory SbuId.fromJson(Map<String, dynamic> json) => _$SbuIdFromJson(json);

  Map<String, dynamic> toJson() => _$SbuIdToJson(this);

  SbuId toSbuId() => SbuId(
    id: id,
    fullName: fullName,
    shortName: shortName,
  );
}
