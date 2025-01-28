import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultLearningActivityRepository extends LearningActivityRepository {
  DefaultLearningActivityRepository({
    MtpApi? api,
    LearningActivityDao? learningActivityDao,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _learningActivityDao = learningActivityDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final LearningActivityDao _learningActivityDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<LearningActivity>> observeLearningActivity({
    required String courseId,
    required String activityId,
  }) async* {
    final result = NetworkBoundResult<LearningActivity, LearningActivityRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getLearningActivity(
          courseId: courseId.toIntOrThrow(),
          activityId: activityId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _learningActivityDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _learningActivityDao
          .observeEntity(id: activityId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }
}
