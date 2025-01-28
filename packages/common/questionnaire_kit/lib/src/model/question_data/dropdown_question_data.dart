import 'package:questionnaire_kit/questionnaire_kit.dart';

class DropdownQuestionData extends QuestionData<UserOptionAnswer> {
  const DropdownQuestionData({
    required super.id,
    required super.content,
    required this.options,
  });

  final List<AnswerOption> options;

  @override
  List<Object?> get props => [
        ...super.props,
        options,
      ];

  @override
  EvaluationQuestionResult evaluate(UserOptionAnswer answer) {
    // TODO: implement evaluate
    throw UnimplementedError();
  }
}