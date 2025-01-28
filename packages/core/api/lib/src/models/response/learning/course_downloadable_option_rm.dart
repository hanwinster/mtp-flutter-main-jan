
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_downloadable_option_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseDownloadableOptionRM {
  @JsonValue(1)
  afterEnrolling,
  @JsonValue(2)
  afterCompletion,
  @JsonValue(-1)
  unknown;


  factory CourseDownloadableOptionRM.fromJson(int value) => decodeEnum(
    _$CourseDownloadableOptionRMEnumMap,
    value,
    unknownValue: CourseDownloadableOptionRM.unknown,
  );

  int toJson() => encodeEnum(_$CourseDownloadableOptionRMEnumMap, this);

  CourseDownloadableOption toDomainModel() {
    switch (this) {
      case CourseDownloadableOptionRM.afterEnrolling:
        return CourseDownloadableOption.afterEnrolling;
      case CourseDownloadableOptionRM.afterCompletion:
        return CourseDownloadableOption.afterCompletion;
      default:
        return CourseDownloadableOption.unknown;
    }
  }
}