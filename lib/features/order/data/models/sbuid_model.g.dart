// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sbuid_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SbuIdAdapter extends TypeAdapter<SbuId> {
  @override
  final int typeId = 2;

  @override
  SbuId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SbuId(
      id: fields[0] as String?,
      fullName: fields[1] as String?,
      shortName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SbuId obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.shortName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SbuIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SbuId _$SbuIdFromJson(Map<String, dynamic> json) => SbuId(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      shortName: json['shortName'] as String?,
    );

Map<String, dynamic> _$SbuIdToJson(SbuId instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'shortName': instance.shortName,
    };
