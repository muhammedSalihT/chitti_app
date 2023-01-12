// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationModelAdapter extends TypeAdapter<RegistrationModel> {
  @override
  final int typeId = 1;

  @override
  RegistrationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationModel(
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String,
      fields[4] as String?,
      fields[5] as String?,
      fields[0] as String?,
      fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.mobileNumber)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.isLoging);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
