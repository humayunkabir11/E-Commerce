// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unitid_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitIdAdapter extends TypeAdapter<UnitId> {
  @override
  final int typeId = 4;

  @override
  UnitId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitId(
      id: fields[0] as String?,
      name: fields[1] as String?,
      details: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnitId obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitId _$UnitIdFromJson(Map<String, dynamic> json) => UnitId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$UnitIdToJson(UnitId instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'details': instance.details,
    };
