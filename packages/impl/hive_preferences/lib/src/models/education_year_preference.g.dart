// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_year_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EducationYearPreferenceAdapter
    extends TypeAdapter<EducationYearPreference> {
  @override
  final int typeId = 7;

  @override
  EducationYearPreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EducationYearPreference(
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EducationYearPreference obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EducationYearPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
