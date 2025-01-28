import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_learner_status_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseLearnerStatusEntity {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('learning')
  learning,
  @JsonValue('completed')
  completed,
  @JsonValue('unknown')
  unknown;


  factory CourseLearnerStatusEntity.fromJson(String value) => decodeEnum(
    _$CourseLearnerStatusEntityEnumMap,
    value,
    unknownValue: CourseLearnerStatusEntity.unknown,
  );

  String toJson() => encodeEnum(_$CourseLearnerStatusEntityEnumMap, this);

  CourseLearnerStatus toDomainModel() {
    switch (this) {
      case CourseLearnerStatusEntity.notStarted:
        return CourseLearnerStatus.notStarted;
      case CourseLearnerStatusEntity.learning:
        return CourseLearnerStatus.learning;
      case CourseLearnerStatusEntity.completed:
        return CourseLearnerStatus.completed;
      default:
        return CourseLearnerStatus.unknown;
    }
  }
}