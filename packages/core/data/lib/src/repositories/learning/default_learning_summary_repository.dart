import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultLearningSummaryRepository extends LearningSummaryRepository {
  DefaultLearningSummaryRepository({
    MtpApi? api,
    LearningSummaryDao? learningSummaryDao,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _learningSummaryDao = learningSummaryDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final LearningSummaryDao _learningSummaryDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<LearningSummary>> observeLearningSummary({
    required String courseId,
    required String summaryId,
  }) async* {
    final result = NetworkBoundResult<LearningSummary, LearningSummaryRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getLearningSummary(
          courseId: courseId.toIntOrThrow(),
          summaryId: summaryId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _learningSummaryDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _learningSummaryDao
          .observeEntity(id: summaryId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }
}
