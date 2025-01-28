import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluation_question_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum EvaluationQuestionTypeRM {
  @JsonValue('agree_disagree')
  agreeDisagree,
  @JsonValue('likely_unlikely')
  likelyUnlikely,
  @JsonValue('device_options')
  deviceOptions,
  @JsonValue('excellent_poor')
  excellentPoor,
  @JsonValue('comment_box')
  comment,
  @JsonValue('unknown')
  unknown;

  factory EvaluationQuestionTypeRM.fromJson(String value) => decodeEnum(
    _$EvaluationQuestionTypeRMEnumMap,
    value,
    unknownValue: EvaluationQuestionTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$EvaluationQuestionTypeRMEnumMap, this);

  EvaluationQuestionType toDomainModel() {
    switch (this) {
      case EvaluationQuestionTypeRM.agreeDisagree:
        return EvaluationQuestionType.agreeDisagree;
      case EvaluationQuestionTypeRM.likelyUnlikely:
        return EvaluationQuestionType.likelyUnlikely;
      case EvaluationQuestionTypeRM.deviceOptions:
        return EvaluationQuestionType.deviceOptions;
      case EvaluationQuestionTypeRM.excellentPoor:
        return EvaluationQuestionType.excellentPoor;
      case EvaluationQuestionTypeRM.comment:
        return EvaluationQuestionType.comment;
      case EvaluationQuestionTypeRM.unknown:
        return EvaluationQuestionType.unknown;
    }
  }
}