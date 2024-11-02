import 'package:aji/features/order/data/models/category_id_model.dart';
import 'package:aji/features/order/data/models/sub_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "categories")
  final List<CategoryId>? categories;
  @JsonKey(name: "subCategories")
  final List<SubCategory>? subCategories;

  CategoryResponse({
    this.status,
    this.categories,
    this.subCategories,
  });

  CategoryResponse copyWith({
    String? status,
    List<CategoryId>? categories,
    List<SubCategory>? subCategories,
  }) =>
      CategoryResponse(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        subCategories: subCategories ?? this.subCategories,
      );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}