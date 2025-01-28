// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenderPreferenceAdapter extends TypeAdapter<GenderPreference> {
  @override
  final int typeId = 4;

  @override
  GenderPreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GenderPreference.male;
      case 1:
        return GenderPreference.female;
      case 2:
        return GenderPreference.other;
      case 3:
        return GenderPreference.unknown;
      default:
        return GenderPreference.male;
    }
  }

  @override
  void write(BinaryWriter writer, GenderPreference obj) {
    switch (obj) {
      case GenderPreference.male:
        writer.writeByte(0);
        break;
      case GenderPreference.female:
        writer.writeByte(1);
        break;
      case GenderPreference.other:
        writer.writeByte(2);
        break;
      case GenderPreference.unknown:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
