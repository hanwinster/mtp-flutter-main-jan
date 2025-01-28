import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultEvaluationRepository extends EvaluationRepository {
  DefaultEvaluationRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<List<EvaluationQuestion>>> observeEvaluationQuestions(
      {required String courseId}) {
    final result = remoteDataSourceCall(
      () => _api.getEvaluation(
        courseId: courseId.toIntOrThrow(),
      ),
    );
    return result.asStream().map((item) {
      return ResultSuccess(
        item.toDomainQuestions(),
      );
    });
  }

  @override
  Future<String> saveEvaluationAnswers({
    required String courseId,
    required List<String> answers,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.postEvaluationAnswers(
        courseId: courseId.toIntOrThrow(),
        answers: answers,
      ),
    );

    return result;
  }
}
