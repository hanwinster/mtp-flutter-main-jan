import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_resource_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum LectureResourceTypeRM {
  @JsonValue('none')
  none,
  @JsonValue('attach_file')
  attachFile,
  @JsonValue('embed_video')
  embedVideo;

  factory LectureResourceTypeRM.fromJson(String value) => decodeEnum(
    _$LectureResourceTypeRMEnumMap,
    value,
    unknownValue: LectureResourceTypeRM.none,
  );

  String toJson() => encodeEnum(_$LectureResourceTypeRMEnumMap, this);

  LectureResourceType toDomainModel() {
    switch (this) {
      case LectureResourceTypeRM.none:
        return LectureResourceType.none;
      case LectureResourceTypeRM.attachFile:
        return LectureResourceType.attachFile;
      default:
        return LectureResourceType.embedVideo;
    }
  }
}