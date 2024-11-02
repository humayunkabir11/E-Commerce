// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  final int typeId = 0;

  @override
  CartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemModel(
      subTotal: fields[0] as num?,
      product: fields[6] as Product?,
      rft: fields[4] as num?,
      weight: fields[5] as num?,
      discountAmount: fields[1] as num?,
      totalAmount: fields[2] as num?,
      quantity: fields[3] as num?,
      orderType: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.subTotal)
      ..writeByte(1)
      ..write(obj.discountAmount)
      ..writeByte(2)
      ..write(obj.totalAmount)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.rft)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.product)
      ..writeByte(7)
      ..write(obj.orderType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
