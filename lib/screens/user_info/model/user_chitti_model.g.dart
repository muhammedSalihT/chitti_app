// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chitti_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserChittiModelAdapter extends TypeAdapter<UserChittiModel> {
  @override
  final int typeId = 2;

  @override
  UserChittiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserChittiModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[5] as String?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserChittiModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.chittiName)
      ..writeByte(2)
      ..write(obj.chitNumber)
      ..writeByte(3)
      ..write(obj.userNumber)
      ..writeByte(5)
      ..write(obj.userEmail)
      ..writeByte(6)
      ..write(obj.totalAmmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserChittiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
