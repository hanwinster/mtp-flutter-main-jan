import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:data/src/util/network_bound_result.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultLectureRepository extends LectureRepository {
  DefaultLectureRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    LectureDao? lectureDao,
  })  : _api = api ?? getIt(),
        _lectureDao = lectureDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final LectureDao _lectureDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<Lecture>> observeLecture({
    required String courseId,
    required String lectureId,
  }) async* {
    final result =
    NetworkBoundResult<Lecture, LectureRM>(
      createCall: () => remoteDataSourceCall(
            () => _api.getLecture(
              courseId: courseId.toIntOrThrow(),
              lectureId: lectureId.toIntOrThrow(),
            ),
      ),
      saveCallResult: (item) async {
        await _lectureDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _lectureDao
      .observeEntity(id: lectureId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }
}
