// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_id_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryIdAdapter extends TypeAdapter<CategoryId> {
  @override
  final int typeId = 3;

  @override
  CategoryId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryId(
      id: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryId obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryId _$CategoryIdFromJson(Map<String, dynamic> json) => CategoryId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryIdToJson(CategoryId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
