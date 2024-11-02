// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      parentCategoryId: json['parentCategoryId'] as String?,
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'parentCategoryId': instance.parentCategoryId,
    };
