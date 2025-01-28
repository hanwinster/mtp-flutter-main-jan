// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguagePreferenceAdapter extends TypeAdapter<LanguagePreference> {
  @override
  final int typeId = 1;

  @override
  LanguagePreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguagePreference.en;
      case 1:
        return LanguagePreference.my;
      default:
        return LanguagePreference.en;
    }
  }

  @override
  void write(BinaryWriter writer, LanguagePreference obj) {
    switch (obj) {
      case LanguagePreference.en:
        writer.writeByte(0);
        break;
      case LanguagePreference.my:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
