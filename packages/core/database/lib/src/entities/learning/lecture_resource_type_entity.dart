import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_resource_type_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum LectureResourceTypeEntity {
  @JsonValue('none')
  none,
  @JsonValue('attach_file')
  attachFile,
  @JsonValue('embed_video')
  embedVideo;

  factory LectureResourceTypeEntity.fromJson(String value) => decodeEnum(
    _$LectureResourceTypeEntityEnumMap,
    value,
    unknownValue: LectureResourceTypeEntity.none,
  );

  String toJson() => encodeEnum(_$LectureResourceTypeEntityEnumMap, this);

  LectureResourceType toDomainModel() {
    switch (this) {
      case LectureResourceTypeEntity.none:
        return LectureResourceType.none;
      case LectureResourceTypeEntity.attachFile:
        return LectureResourceType.attachFile;
      default:
        return LectureResourceType.embedVideo;
    }
  }
}