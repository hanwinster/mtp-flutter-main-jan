import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum CourseMaterialTypeEntity {
  // remark: the order types are default and flexible
  // but the default is a reserved word in dart
  // so we use fixed instead of default
  @JsonValue('course')
  intro,
  @JsonValue('lecture')
  lecture,
  @JsonValue('learning_activity')
  learningActivity,
  @JsonValue('learning')
  learning,
  @JsonValue('quiz')
  quiz,
  @JsonValue('session')
  liveSession,
  @JsonValue('summary')
  summary,
  @JsonValue('assessment')
  assessment,
  @JsonValue('evaluation')
  evaluation,
  @JsonValue('unknown')
  unknown;

  factory CourseMaterialTypeEntity.fromJson(String value) => decodeEnum(
        _$CourseMaterialTypeEntityEnumMap,
        value,
        unknownValue: CourseMaterialTypeEntity.unknown,
      );

  String toJson() => encodeEnum(_$CourseMaterialTypeEntityEnumMap, this);

  CourseMaterialType toDomainModel() {
    switch (this) {
      case CourseMaterialTypeEntity.intro:
        return CourseMaterialType.intro;
      case CourseMaterialTypeEntity.lecture:
        return CourseMaterialType.lecture;
      case CourseMaterialTypeEntity.learningActivity:
      case CourseMaterialTypeEntity.learning:
        return CourseMaterialType.learningActivity;
      case CourseMaterialTypeEntity.quiz:
        return CourseMaterialType.quiz;
      case CourseMaterialTypeEntity.liveSession:
        return CourseMaterialType.liveSession;
      case CourseMaterialTypeEntity.summary:
        return CourseMaterialType.summary;
      case CourseMaterialTypeEntity.assessment:
        return CourseMaterialType.assessment;
      case CourseMaterialTypeEntity.evaluation:
        return CourseMaterialType.evaluation;
      default:
        return CourseMaterialType.unknown;
    }
  }
}
