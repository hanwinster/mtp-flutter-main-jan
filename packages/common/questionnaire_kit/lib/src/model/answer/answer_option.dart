import 'package:base/base.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

class AnswerOption extends Equatable {
  final String id;
  final QuestionContent content;

  const AnswerOption({
    required this.id,
    required this.content,
  });

  @override
  List<Object> get props => [id, content];
}