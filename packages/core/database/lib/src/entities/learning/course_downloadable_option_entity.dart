
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_downloadable_option_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseDownloadableOptionEntity {
  @JsonValue(1)
  afterEnrolling,
  @JsonValue(2)
  afterCompletion,
  @JsonValue(-1)
  unknown;


  factory CourseDownloadableOptionEntity.fromJson(int value) => decodeEnum(
    _$CourseDownloadableOptionEntityEnumMap,
    value,
    unknownValue: CourseDownloadableOptionEntity.unknown,
  );

  int toJson() => encodeEnum(_$CourseDownloadableOptionEntityEnumMap, this);

  CourseDownloadableOption toDomainModel() {
    switch (this) {
      case CourseDownloadableOptionEntity.afterEnrolling:
        return CourseDownloadableOption.afterEnrolling;
      case CourseDownloadableOptionEntity.afterCompletion:
        return CourseDownloadableOption.afterCompletion;
      default:
        return CourseDownloadableOption.unknown;
    }
  }
}