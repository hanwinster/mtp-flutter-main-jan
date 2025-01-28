import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class EvaluationRepository {
  Stream<Result<List<EvaluationQuestion>>> observeEvaluationQuestions({
    required String courseId,
  });

  Future<String> saveEvaluationAnswers({
    required String courseId,
    required List<String> answers,
  });
}
