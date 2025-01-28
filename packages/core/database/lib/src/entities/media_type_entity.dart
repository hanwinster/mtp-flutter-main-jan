import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaTypeEntity {
  @JsonValue('video')
  video,
  @JsonValue('audio')
  audio,
  @JsonValue('pdf')
  pdf,
  @JsonValue('image')
  image,
  @JsonValue('unknown')
  unknown;

  factory MediaTypeEntity.fromJson(String value) => decodeEnum(
        _$MediaTypeEntityEnumMap,
        value,
        unknownValue: MediaTypeEntity.unknown,
      );

  String toJson() => encodeEnum(_$MediaTypeEntityEnumMap, this);

  MediaType toDomainModel() {
    switch (this) {
      case MediaTypeEntity.video:
        return MediaType.video;
      case MediaTypeEntity.audio:
        return MediaType.audio;
      case MediaTypeEntity.pdf:
        return MediaType.pdf;
      case MediaTypeEntity.image:
        return MediaType.image;
      case MediaTypeEntity.unknown:
        return MediaType.unknown;
    }
  }
}
