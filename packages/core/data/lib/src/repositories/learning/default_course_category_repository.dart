import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';


class DefaultCourseCategoryRepository extends CourseCategoryRepository {
  DefaultCourseCategoryRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    CourseCategoryDao? courseCategoryDao,
  })  : _api = api ?? getIt(),
        _courseCategoryDao = courseCategoryDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;
  final CourseCategoryDao _courseCategoryDao;

  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<List<CourseCategory>>> observeCategories() async* {
    final languageCode = await _prefs.languageCodeOrDefault;
    final rateLimitKey = '$languageCode:course-categories';
    final result =
        NetworkBoundResult<List<CourseCategory>, List<CourseCategoryRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getCourseCategories(),
      ),
      saveCallResult: (items) async {
        await _courseCategoryDao.deleteAllEntities();
        await _courseCategoryDao.upsertEntities(
            entities: items.map((e) => e.toEntity()).toList());
      },
      loadFromDb: () => _courseCategoryDao
          .observeEntities()
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data == null ||
            rateLimiter.shouldFetch(rateLimitKey);
      },
      onFetchFailed: () async {
        rateLimiter.reset(rateLimitKey);
      },
    );
    yield* result.asStream();
  }
}
