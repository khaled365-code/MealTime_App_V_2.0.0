// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_all_meals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemMealsAdapter extends TypeAdapter<SystemMeals> {
  @override
  final int typeId = 10;

  @override
  SystemMeals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemMeals(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as num?,
      howToSell: fields[4] as String?,
      images: (fields[5] as List?)?.cast<String>(),
      category: fields[6] as String?,
      chefId: fields[7] as ChefData?,
      status: fields[8] as String?,
      createdAt: fields[9] as String?,
      updatedAt: fields[10] as String?,
      v: fields[11] as num?,
    )..itemIsSelected = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, SystemMeals obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.howToSell)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.chefId)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.v)
      ..writeByte(12)
      ..write(obj.itemIsSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemMealsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
