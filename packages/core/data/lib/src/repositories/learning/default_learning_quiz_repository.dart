import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultLearningQuizRepository extends LearningQuizRepository {
  DefaultLearningQuizRepository({
    MtpApi? api,
    LearningQuizDao? learningQuizDao,
    PreferencesDataSource? prefs,
  })  : _api = api ?? getIt(),
        _learningQuizDao = learningQuizDao ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final LearningQuizDao _learningQuizDao;
  final PreferencesDataSource _prefs;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<LearningQuiz>> observeLearningQuiz({
    required String courseId,
    required String quizId,
  }) async* {
    final userId = (await _prefs.getUser())?.id ?? '';
    if (userId.isEmpty) {
      throw const UnauthorizedDomainException();
    }

    final result = NetworkBoundResult<LearningQuiz, LearningQuizRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getLearningQuiz(
          courseId: courseId.toIntOrThrow(),
          quizId: quizId.toIntOrThrow(),
          userId: userId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _learningQuizDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _learningQuizDao
          .observeEntity(id: quizId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }

  @override
  Future<void> saveQuizAnswer({
    required String courseId,
    required String quizId,
    required Map<String, QuizAnswer> answersById,
    required LearningQuizType quizType,
  }) async {
    try {
      if (quizType == LearningQuizType.shortQuestion) {
        await remoteDataSourceCall(() => _api.postQuizShortAnswer(
              courseId: courseId.toIntOrThrow(),
              quizId: quizId.toIntOrThrow(),
              answersById: answersById.map(
                (key, value) => MapEntry(
                  key.toIntOrThrow(),
                  (value as QuizStringAnswer).answer,
                ),
              ),
            ));
      } else if (quizType == LearningQuizType.longQuestion) {
        await remoteDataSourceCall(
          () => _api.postQuizLongAnswer(
            courseId: courseId.toIntOrThrow(),
            quizId: quizId.toIntOrThrow(),
            answersById: answersById.map(
              (key, value) => MapEntry(
                key.toIntOrThrow(),
                (value as QuizStringAnswer).answer,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> submitAssignment({
    required String courseId,
    required String quizId,
    required String assignmentId,
    required String currentSection,
    required CourseNavigationDirection direction,
    required File file,
  }) async {
    final result = await remoteDataSourceCall(() => _api.postAssignment(
          courseId: courseId.toIntOrThrow(),
          quizId: quizId.toIntOrThrow(),
          assignmentId: assignmentId.toIntOrThrow(),
          redirect:
              CourseNavigationDirectionRM.fromDomainModel(direction).toJson(),
          currentSection: currentSection,
          file: file,
        ));
    return result.message ?? '';
  }
}