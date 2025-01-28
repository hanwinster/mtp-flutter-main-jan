import 'package:base/base.dart';
import 'package:domain/domain.dart';

sealed class EvaluationQuestion extends Equatable {
  final String id;
  final String question;
  final int order;
  final EvaluationQuestionType type;

  const EvaluationQuestion({
    required this.id,
    required this.question,
    required this.order,
    required this.type,
  });

  @override
  List<Object?> get props => [id, question, order, type];
}

final class EvaluationLikertQuestion extends EvaluationQuestion {
  const EvaluationLikertQuestion({
    required super.id,
    required super.question,
    required super.order,
    required super.type,
    required this.levels,
  });

  final List<EvaluationLikertLevel> levels;

  @override
  List<Object?> get props => super.props..addAll([levels]);
}

final class EvaluationDeviceQuestion extends EvaluationQuestion {
  const EvaluationDeviceQuestion({
    required super.id,
    required super.question,
    required super.order,
    required super.type,
    required this.options,
  });

  final List<EvaluationDeviceOption> options;

  @override
  List<Object?> get props => super.props..addAll([options]);
}

final class EvaluationCommentQuestion extends EvaluationQuestion {
  const EvaluationCommentQuestion({
    required super.id,
    required super.question,
    required super.order,
    required super.type,
  });
}
