import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultLiveSessionRepository extends LiveSessionRepository {
  DefaultLiveSessionRepository({
    MtpApi? api,
    LiveSessionDao? liveSessionDao,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _liveSessionDao = liveSessionDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final LiveSessionDao _liveSessionDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<LiveSession>> observeLiveSession({
    required String courseId,
    required String liveSessionId,
  }) async* {
    final result = NetworkBoundResult<LiveSession, LiveSessionRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getLiveSession(
          courseId: courseId.toIntOrThrow(),
          sessionId: liveSessionId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _liveSessionDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _liveSessionDao
          .observeEntity(id: liveSessionId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }
}
