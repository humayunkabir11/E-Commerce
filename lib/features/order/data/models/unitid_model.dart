import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unitid_model.g.dart';

@HiveType(typeId: 4) // Assign a unique typeId for the UnitId class
@JsonSerializable()
class UnitId {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;

  @HiveField(1)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(2)
  @JsonKey(name: "details")
  final String? details;

  UnitId({
    this.id,
    this.name,
    this.details,
  });

  UnitId copyWith({
    String? id,
    String? name,
    String? details,
  }) =>
      UnitId(
        id: id ?? this.id,
        name: name ?? this.name,
        details: details ?? this.details,
      );

  factory UnitId.fromJson(Map<String, dynamic> json) => _$UnitIdFromJson(json);

  Map<String, dynamic> toJson() => _$UnitIdToJson(this);
}
