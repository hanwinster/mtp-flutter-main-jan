import 'evaluation_question_result.dart';

abstract class Evaluable<T> {
  EvaluationQuestionResult evaluate(T answer);
}