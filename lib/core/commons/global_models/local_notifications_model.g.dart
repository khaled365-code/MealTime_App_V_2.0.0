// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_notifications_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalNotificationsModelAdapter
    extends TypeAdapter<LocalNotificationsModel> {
  @override
  final int typeId = 3;

  @override
  LocalNotificationsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalNotificationsModel(
      fields[5] as String,
      payload: fields[4] as String?,
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalNotificationsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.payload)
      ..writeByte(5)
      ..write(obj.notificationTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalNotificationsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
