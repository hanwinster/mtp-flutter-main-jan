import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluation_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class EvaluationResponseRM extends Equatable {
  @JsonKey(name: 'evaluation_questions')
  final List<EvaluationQuestionRM>? evaluationQuestions;
  @JsonKey(name: 'agree_levels')
  final Map<String, String>? agreeLevels;
  @JsonKey(name: 'likely_levels')
  final Map<String, String>? likelyLevels;
  @JsonKey(name: 'excellent_levels')
  final Map<String, String>? excellentLevels;
  @JsonKey(name: 'device_options')
  final Map<String, String>? deviceOptions;

  const EvaluationResponseRM({
    this.evaluationQuestions,
    this.agreeLevels,
    this.likelyLevels,
    this.excellentLevels,
    this.deviceOptions,
  });

  @override
  List<Object?> get props => [
        evaluationQuestions,
        agreeLevels,
        likelyLevels,
        excellentLevels,
        deviceOptions,
      ];

  factory EvaluationResponseRM.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResponseRMFromJson(json);

  EvaluationLikertLevel _mapLikertLevel(String key, String value) {
    return EvaluationLikertLevel(
      level: key.toIntOrThrow(),
      description: value,
    );
  }

  List<EvaluationLikertLevel> _mapLikertLevels(Map<String, String>? levels) {
    return levels?.entries.map((entry) {
          return _mapLikertLevel(entry.key, entry.value);
        }).toList() ??
        [];
  }

  EvaluationDeviceOption _mapDeviceOption(String key, String value) {
    return EvaluationDeviceOption(
      id: key,
      description: value,
    );
  }

  List<EvaluationDeviceOption> _mapDeviceOptions(Map<String, String>? options) {
    return options?.entries.map((entry) {
          return _mapDeviceOption(entry.key, entry.value);
        }).toList() ??
        [];
  }

  List<EvaluationQuestion> toDomainQuestions() {
    return evaluationQuestions?.map((question) {
          if (question.type == EvaluationQuestionTypeRM.agreeDisagree) {
            return question.mapLikertQuestion(
              levels: _mapLikertLevels(agreeLevels),
            );
          } else if (question.type == EvaluationQuestionTypeRM.likelyUnlikely) {
            return question.mapLikertQuestion(
              levels: _mapLikertLevels(likelyLevels),
            );
          } else if (question.type == EvaluationQuestionTypeRM.excellentPoor) {
            return question.mapLikertQuestion(
              levels: _mapLikertLevels(excellentLevels),
            );
          } else if (question.type == EvaluationQuestionTypeRM.deviceOptions) {
            return question.mapDeviceQuestion(
              options: _mapDeviceOptions(deviceOptions),
            );
          } else if (question.type == EvaluationQuestionTypeRM.comment) {
            return question.mapCommentQuestion();
          } else {
            //TODO: handle unknown type
            return question.mapCommentQuestion();
          }
        }).toList() ??
        [];
  }
}
