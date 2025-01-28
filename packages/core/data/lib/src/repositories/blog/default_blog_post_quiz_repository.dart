import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/blog/blog.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';


class DefaultBlogPostQuizRepository extends BlogPostQuizRepository {
  DefaultBlogPostQuizRepository({
    MtpApi? api,
    BlogPostDao? blogPostDao,
  })  : _api = api ?? getIt(),
        _blogPostDao = blogPostDao ?? getIt();

  final MtpApi _api;
  final BlogPostDao _blogPostDao;

  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Future<List<BlogPostQuizQuestion>> getQuestions({
    required String postId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.getBlogPostQuizQuestions(postId: postId),
    );
    return result.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<void> saveAnswers({
    required String postId,
    required BlogPostQuizQuestion question,
    required Map<int, String> answersByIndex,
  }) async {
    final answersByKey = answersByIndex.map(
      (key, value) => MapEntry(
        'answers[$key]',
        value,
      ),
    );

    if (question.userAnswer != null) {
      await remoteDataSourceCall(
        () => _api.updateBlogPostQuizUserAnswers(
          postId: postId,
          questionId: question.id,
          answers: answersByKey,
        ),
      );
    } else {
      await remoteDataSourceCall(
        () => _api.saveBlogPostQuizUserAnswers(
          postId: postId,
          questionId: question.id,
          answers: answersByKey,
        ),
      );
    }
  }

  @override
  Future<BlogPostQuizUserAnswerResult> submitAnswers({
    required String postId,
  }) async {
    try {
      final result = await remoteDataSourceCall(
            () => _api.submitBlogPostQuizUserAnswer(postId: postId),
      );

      final remotePost = await _api.getBlogPost(postId: postId.toIntOrThrow());
      await _blogPostDao.upsertEntity(
        entity: remotePost.toEntity(),
      );
      return result.toDomainModel();
    } catch (e, s) {
      logger.e('Error submitting quiz answers', e, s);
      rethrow;
    }
  }
}
