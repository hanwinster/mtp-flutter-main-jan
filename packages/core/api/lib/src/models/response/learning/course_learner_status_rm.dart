import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_learner_status_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseLearnerStatusRM {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('learning')
  learning,
  @JsonValue('completed')
  completed,
  @JsonValue('unknown')
  unknown;


  factory CourseLearnerStatusRM.fromJson(String value) => decodeEnum(
    _$CourseLearnerStatusRMEnumMap,
    value,
    unknownValue: CourseLearnerStatusRM.unknown,
  );

  String toJson() => encodeEnum(_$CourseLearnerStatusRMEnumMap, this);

  CourseLearnerStatus toDomainModel() {
    switch (this) {
      case CourseLearnerStatusRM.notStarted:
        return CourseLearnerStatus.notStarted;
      case CourseLearnerStatusRM.learning:
        return CourseLearnerStatus.learning;
      case CourseLearnerStatusRM.completed:
        return CourseLearnerStatus.completed;
      default:
        return CourseLearnerStatus.unknown;
    }
  }
}