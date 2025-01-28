import 'package:domain/domain.dart';

abstract class BlogPostQuizRepository {
  Future<List<BlogPostQuizQuestion>> getQuestions({
    required String postId,
  });

  Future<void> saveAnswers({
    required String postId,
    required BlogPostQuizQuestion question,
    required Map<int, String> answersByIndex,
  });

  Future<BlogPostQuizUserAnswerResult> submitAnswers({
    required String postId,
  });
}
