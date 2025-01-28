import 'package:base/base.dart';
import 'package:domain/domain.dart';

class AssessmentQuestion extends Equatable {
  const AssessmentQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswers,
    required this.passingOption,
    required this.order,
    required this.type,
    required this.userAnswer,
  });

  final String id;
  final String question;
  final List<String> options;
  final List<String> correctAnswers;
  final AssessmentQuestionPassingOption passingOption;
  final int order;
  final AssessmentQuestionType type;
  final AssessmentUserAnswer? userAnswer;

  @override
  List<Object?> get props => [
        id,
        question,
        options,
        correctAnswers,
        passingOption,
        order,
        type,
        userAnswer,
      ];

  AssessmentQuestion copyWith({
    String? id,
    String? question,
    List<String>? options,
    List<String>? correctAnswers,
    AssessmentQuestionPassingOption? passingOption,
    int? order,
    AssessmentQuestionType? type,
    AssessmentUserAnswer? userAnswer,
  }) {
    return AssessmentQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      passingOption: passingOption ?? this.passingOption,
      order: order ?? this.order,
      type: type ?? this.type,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }
}
