import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import 'evaluation_question_type_rm.dart';

part 'evaluation_question_rm.g.dart';

@JsonSerializable(createToJson: false)
class EvaluationQuestionRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(
    name: 'type',
    unknownEnumValue: EvaluationQuestionTypeRM.unknown,
  )
  final EvaluationQuestionTypeRM? type;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const EvaluationQuestionRM({
    this.id,
    this.question,
    this.order,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        order,
        type,
        createdAt,
        updatedAt,
      ];

  factory EvaluationQuestionRM.fromJson(Map<String, dynamic> json) =>
      _$EvaluationQuestionRMFromJson(json);

  EvaluationQuestion mapLikertQuestion({
    required List<EvaluationLikertLevel> levels,
  }) {
    return EvaluationLikertQuestion(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      question: question ?? '',
      order: order ?? 0,
      type: type?.toDomainModel() ?? (throw Exception('type must not be null')),
      levels: levels,
    );
  }

  EvaluationQuestion mapDeviceQuestion({
    required List<EvaluationDeviceOption> options,
  }) {
    return EvaluationDeviceQuestion(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      question: question ?? '',
      order: order ?? 0,
      type: type?.toDomainModel() ?? (throw Exception('type must not be null')),
      options: options,
    );
  }

  EvaluationQuestion mapCommentQuestion() {
    return EvaluationCommentQuestion(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      question: question ?? '',
      order: order ?? 0,
      type: type?.toDomainModel() ?? (throw Exception('type must not be null')),
    );
  }
}
