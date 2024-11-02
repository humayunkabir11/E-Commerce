import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_id_model.g.dart';

@HiveType(typeId: 3) // Assign a unique typeId for the CategoryId class
@JsonSerializable()
class CategoryId {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;

  @HiveField(1)
  @JsonKey(name: "name")
  final String? name;

  CategoryId({
    this.id,
    this.name,
  });

  CategoryId copyWith({
    String? id,
    String? name,
  }) =>
      CategoryId(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CategoryId.fromJson(Map<String, dynamic> json) => _$CategoryIdFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryIdToJson(this);
}
