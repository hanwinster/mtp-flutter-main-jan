import 'package:base/base.dart';
import 'package:domain/domain.dart';

sealed class LearningQuizQuestion extends Equatable {
  final String id;
  final String title;
  final String explanation;

  const LearningQuizQuestion({
    required this.id,
    required this.title,
    required this.explanation,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        explanation,
      ];
}

final class LearningQuizShortQuestion extends LearningQuizQuestion {
  final LearningQuizShortQuestionAnswer answer;

  const LearningQuizShortQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizLongQuestion extends LearningQuizQuestion {
  final LearningQuizLongQuestionAnswer answer;

  const LearningQuizLongQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizTrueFalseQuestion extends LearningQuizQuestion {
  final LearningQuizTrueFalseAnswer answer;

  const LearningQuizTrueFalseQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizMatchingQuestion extends LearningQuizQuestion {
  final LearningQuizMatchingAnswer answer;

  const LearningQuizMatchingQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizMultipleChoiceQuestion extends LearningQuizQuestion {
  final List<LearningQuizMultipleChoiceAnswer> answers;

  const LearningQuizMultipleChoiceQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answers,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answers]);
}

final class LearningQuizFillInTheBlankQuestion extends LearningQuizQuestion {
  final LearningQuizFillInTheBlankAnswer answer;

  const LearningQuizFillInTheBlankQuestion({
  required super.id,
  required super.title,
  required super.explanation,
  required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizRearrangeQuestion extends LearningQuizQuestion {
  final LearningQuizRearrangeAnswer answer;

  const LearningQuizRearrangeQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.answer,
  });

  @override
  List<Object?> get props =>
      super.props..addAll([answer]);
}

final class LearningQuizAssignmentQuestion extends LearningQuizQuestion {
  final LearningQuizAssignment assignment;
  final LearningQuizAssignmentUserAnswer? userAnswer;
  final String attachedFileUrl;

  const LearningQuizAssignmentQuestion({
    required super.id,
    required super.title,
    required super.explanation,
    required this.assignment,
    required this.attachedFileUrl,
    required this.userAnswer,
  });

  Media? get attachedFileMedia {
    if (attachedFileUrl.isEmpty) {
      return null;
    }
    return Media.fromFileUrl(attachedFileUrl);
  }
}
