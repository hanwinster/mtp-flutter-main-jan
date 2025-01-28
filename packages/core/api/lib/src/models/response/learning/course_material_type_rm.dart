import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum CourseMaterialTypeRM {
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
  @JsonValue('session')
  liveSession,
  @JsonValue('quiz')
  quiz,
  @JsonValue('summary')
  summary,
  @JsonValue('assessment')
  assessment,
  @JsonValue('evaluation')
  evaluation,
  @JsonValue('unknown')
  unknown;

  factory CourseMaterialTypeRM.fromJson(String value) => decodeEnum(
        _$CourseMaterialTypeRMEnumMap,
        value,
        unknownValue: CourseMaterialTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$CourseMaterialTypeRMEnumMap, this);

  CourseMaterialType toDomainModel() {
    switch (this) {
      case CourseMaterialTypeRM.intro:
        return CourseMaterialType.intro;
      case CourseMaterialTypeRM.lecture:
        return CourseMaterialType.lecture;
      case CourseMaterialTypeRM.learningActivity:
      case CourseMaterialTypeRM.learning:
        return CourseMaterialType.learningActivity;
      case CourseMaterialTypeRM.quiz:
        return CourseMaterialType.quiz;
        case CourseMaterialTypeRM.liveSession:
        return CourseMaterialType.liveSession;
      case CourseMaterialTypeRM.summary:
        return CourseMaterialType.summary;
      case CourseMaterialTypeRM.assessment:
        return CourseMaterialType.assessment;
      case CourseMaterialTypeRM.evaluation:
        return CourseMaterialType.evaluation;
      default:
        return CourseMaterialType.unknown;
    }
  }
}
