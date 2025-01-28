import 'dart:async';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/data.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:data/src/util/network_bound_result.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:uuid/uuid.dart';

class DefaultCourseRepository extends CourseRepository {
  DefaultCourseRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    CourseLearnerDao? courseLearnerDao,
    UserCourseDao? userCourseDao,
    OfflineCourseDao? offlineCourseDao,
    OfflineCourseMediaDao? offlineCourseMediaDao,
    CourseDownloadStatusDao? courseDownloadStatusDao,
  })  : _api = api ?? getIt(),
        _prefs = prefs ?? getIt(),
        _courseLearnerDao = courseLearnerDao ?? getIt(),
        _userCourseDao = userCourseDao ?? getIt(),
        _offlineCourseDao = offlineCourseDao ?? getIt(),
        _offlineCourseMediaDao = offlineCourseMediaDao ?? getIt(),
        _courseDownloadStatusDao = courseDownloadStatusDao ?? getIt();

  final MtpApi _api;
  final CourseLearnerDao _courseLearnerDao;
  final UserCourseDao _userCourseDao;
  final OfflineCourseDao _offlineCourseDao;
  final OfflineCourseMediaDao _offlineCourseMediaDao;
  final CourseDownloadStatusDao _courseDownloadStatusDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Future<List<Course>> getCourses({
    required int page,
    required int limit,
    required String keyword,
    required String categoryId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.getCourses(
        keyword: keyword,
        categoryId: categoryId.toIntOrNull(),
        page: page,
        limit: limit,
      ),
    );
    return result.map((item) {
      return item.toDomainModel();
    }).toList();
  }

  @override
  Stream<Result<List<Course>>> observeCourses({
    required int page,
    required int limit,
    required String keyword,
    required String categoryId,
  }) async* {
    final result = remoteDataSourceCall(
      () => _api.getCourses(
        keyword: keyword,
        categoryId: categoryId.toIntOrNull(),
        page: page,
        limit: limit,
      ),
    );
    yield* result.asStream().map((list) {
      return ResultSuccess(
        list.map((item) {
          return item.toDomainModel();
        }).toList(),
      );
    });
  }

  @override
  Stream<Result<List<Course>>> observeUserCourses({
    required String keyword,
    required String categoryId,
    required bool completed,
  }) async* {
    final result = NetworkBoundResult<List<Course>, List<CourseRM>>(
      loadFromDb: () {
        return _userCourseDao
            .observeEntities(
              completed: completed,
            )
            .map((entities) => entities.map((e) => e.toDomainModel()).toList());
      },
      shouldFetch: (data) => true,
      createCall: () => _api.getUserCourses(
        keyword: keyword,
        completed: completed,
        categoryId: categoryId.toIntOrNull(),
      ),
      saveCallResult: (items) async {
        // Delete the courses that are not in the new list
        final dbCourseIds =
            await _userCourseDao.getCourseIds(completed: completed);
        final newCourseIds = items.map((e) => e.id.toString()).toList();
        final courseIdsToDelete =
            dbCourseIds.where((id) => !newCourseIds.contains(id)).toList();
        if (courseIdsToDelete.isNotEmpty) {
          await _userCourseDao.deleteEntities(courseIds: courseIdsToDelete);
        }

        await _userCourseDao.insertOrIgnoreEntities(
            entities: items.map((e) => e.toEntity()).toList());
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }

  @override
  Stream<Result<Course>> observeCourse({
    required String courseId,
    bool forceRefresh = false,
  }) async* {
    final authState = await _prefs.getAuthState();
    final result = NetworkBoundResult<Course, CourseRM>(
      createCall: () => remoteDataSourceCall(
        () => authState.isLoggedIn
            ? _api.getUserCourse(courseId: courseId.toIntOrThrow())
            : _api.getCourse(courseId: courseId.toIntOrThrow()),
      ),
      saveCallResult: (item) async {
        await _userCourseDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _userCourseDao
          .observeEntity(id: courseId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {
        rateLimiter.reset('course:$courseId');
      },
    );
    yield* result.asStream();
  }

  @override
  Future<XApiCourse> getXApiCourse({
    required String courseId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.getXApiCourse(courseId: courseId.toIntOrThrow()),
    );
    return result.toDomainModel();
  }

  @override
  Stream<List<OfflineCourse>> observeOfflineCourses() {
    return _offlineCourseDao
        .observeEntities()
        .map((entities) => entities.map((e) => e.toDomainModel()).toList());
  }

  @override
  Stream<List<OfflineCourseMedia>> observeOfflineCourseMedias() {
    return _offlineCourseMediaDao
        .observeEntities()
        .map((entities) => entities.map((e) => e.toDomainModel()).toList());
  }

  @override
  Future<void> saveOfflineCourseMedia({
    required String courseId,
    required String url,
    required String title,
  }) async {
    final course = await _userCourseDao.getEntity(courseId: courseId);
    if (course == null) {
      return;
    }

    await _offlineCourseMediaDao.upsertEntity(
      entity: OfflineCourseMediaEntity(
        id: const Uuid().v4(),
        courseId: courseId,
        url: url,
        title: title,
        thumbnail: course.coverImage.medium,
      ),
    );
  }

  @override
  Stream<CourseDownloadStatus?> observeCourseDownloadStatus({
    required String courseId,
  }) {
    return _courseDownloadStatusDao
        .observeEntity(courseId: courseId)
        .map((entity) => entity?.toDomainModel());
  }

  @override
  Future<CourseLearner> takeCourse({required String courseId}) async {
    final result = await remoteDataSourceCall(
      () => _api.takeCourse(courseId: courseId.toIntOrThrow()),
    );
    return result.toDomainModel();
  }

  @override
  Stream<Result<CourseLearner>> observeCourseLearner({
    required String learnerId,
  }) async* {
    final result = NetworkBoundResult<CourseLearner, CourseLearnerRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getCourseLearner(
          learnerId: learnerId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _courseLearnerDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _courseLearnerDao
          .observeEntity(entityId: learnerId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) => true,
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }

  @override
  Future<CourseLearner?> getCourseLearnerByCourseId({
    required String courseId,
  }) async {
    final courseLearnerEntity =
        await _courseLearnerDao.getCourseLearnerByCourseId(
      courseId: courseId,
    );
    return courseLearnerEntity?.toDomainModel();
  }

  @override
  Future<CourseMaterial?> updateCompletion({
    required String courseId,
    required String currentSection,
    required CourseNavigationDirection direction,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.updateCompletion(
        courseId: courseId.toIntOrThrow(),
        currentSection: currentSection,
        redirect:
            CourseNavigationDirectionRM.fromDomainModel(direction).toJson(),
      ),
    );
    return result.nextCourseMaterial?.toDomainModel();
  }

  @override
  Future<void> cancelCourse({
    required String courseId,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.cancelCourse(courseId: courseId.toIntOrThrow()),
      );
      await _userCourseDao.deleteEntity(courseId: courseId);
    } catch (e, s) {
      logger.e('Failed to cancel course', e, s);
      rethrow;
    }
  }

  @override
  Future<void> markCourseDownloadStatusAsHandled({
    required String courseId,
  }) async {
    await _courseDownloadStatusDao.markAsHandled(courseId: courseId);
  }

  @override
  Future<void> deleteOfflineCourse({
    required String courseId,
  }) async {
    await _courseDownloadStatusDao.deleteEntity(courseId: courseId);
    await _offlineCourseDao.deleteEntity(courseId: courseId);
  }

  @override
  Future<void> deleteOfflineCourseMedia({
    required String id,
  }) async {
    await _offlineCourseMediaDao.deleteEntity(id: id);
  }
}
