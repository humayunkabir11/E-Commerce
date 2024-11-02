import 'package:json_annotation/json_annotation.dart';

part 'sub_category.g.dart';

@JsonSerializable()
class SubCategory {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "parentCategoryId")
  final String? parentCategoryId;

  SubCategory({
    this.id,
    this.name,
    this.parentCategoryId,
  });

  SubCategory copyWith({
    String? id,
    String? name,
    String? parentCategoryId,
  }) =>
      SubCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
