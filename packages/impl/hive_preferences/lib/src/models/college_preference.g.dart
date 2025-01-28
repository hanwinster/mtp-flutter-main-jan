// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollegePreferenceAdapter extends TypeAdapter<CollegePreference> {
  @override
  final int typeId = 3;

  @override
  CollegePreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollegePreference(
      id: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CollegePreference obj) {
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
      other is CollegePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
