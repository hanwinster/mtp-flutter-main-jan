import 'package:equatable/equatable.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

abstract class QuestionData<A> extends Equatable implements Evaluable<A> {
  final String id;
  final QuestionContent content;
  final String explanation;
  final String Function(int numberOfCorrectAnswers)? getHint;

  const QuestionData({
    required this.id,
    required this.content,
    this.explanation = '',
    this.getHint,
  });

  @override
  List<Object?> get props => [id, content];
}
