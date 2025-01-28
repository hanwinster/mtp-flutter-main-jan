import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaTypeRM {
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

  factory MediaTypeRM.fromJson(String value) => decodeEnum(
        _$MediaTypeRMEnumMap,
        value,
        unknownValue: MediaTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$MediaTypeRMEnumMap, this);

  MediaType toDomainModel() {
    switch (this) {
      case MediaTypeRM.video:
        return MediaType.video;
      case MediaTypeRM.audio:
        return MediaType.audio;
      case MediaTypeRM.pdf:
        return MediaType.pdf;
      case MediaTypeRM.image:
        return MediaType.image;
      case MediaTypeRM.unknown:
        return MediaType.unknown;
    }
  }
}
