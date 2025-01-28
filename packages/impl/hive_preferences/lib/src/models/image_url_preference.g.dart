// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_url_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageUrlPreferenceAdapter extends TypeAdapter<ImageUrlPreference> {
  @override
  final int typeId = 8;

  @override
  ImageUrlPreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageUrlPreference(
      original: fields[0] as String,
      thumbnail: fields[1] as String,
      medium: fields[2] as String,
      large: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageUrlPreference obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageUrlPreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
