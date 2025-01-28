import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/data.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../../util/network_bound_result.dart';

class DefaultCourseAssessmentRepository extends CourseAssessmentRepository {
  DefaultCourseAssessmentRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    CourseAssessmentQuestionDao? assessmentQuestionDao,
  })  : _api = api ?? getIt(),
        _prefs = prefs ?? getIt(),
        _assessmentQuestionDao = assessmentQuestionDao ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;
  final CourseAssessmentQuestionDao _assessmentQuestionDao;
  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<AssessmentQuestion>> observeAssessmentQuestion({
    required String courseId,
    required String questionId,
  }) async* {
    final userId = (await _prefs.getUser())?.id ?? '';
    if (userId.isEmpty) {
      return;
    }

    final result = NetworkBoundResult<AssessmentQuestion, AssessmentQuestionRM>(
      createCall: () => remoteDataSourceCall(
        () => _api.getAssessmentQuestion(
          courseId: courseId.toIntOrThrow(),
          questionId: questionId.toIntOrThrow(),
          userId: userId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (item) async {
        await _assessmentQuestionDao.upsertEntity(entity: item.toEntity());
      },
      loadFromDb: () => _assessmentQuestionDao
          .observeEntity(id: questionId)
          .map((entity) => entity?.toDomainModel()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }

  @override
  Stream<Result<List<AssessmentQuestion>>> observeAssessmentQuestions({
    required String courseId,
  }) async* {
    final userId = (await _prefs.getUser())?.id ?? '';
    if (userId.isEmpty) {
      return;
    }
    final result = NetworkBoundResult<List<AssessmentQuestion>,
        List<AssessmentQuestionRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getAssessmentQuestions(
          courseId: courseId.toIntOrThrow(),
          userId: userId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (items) async {
        await _assessmentQuestionDao.deleteAllByCourseId(courseId: courseId);
        await _assessmentQuestionDao.upsertEntities(
          entities: items.map((question) => question.toEntity()).toList(),
        );
      },
      loadFromDb: () => _assessmentQuestionDao
          .observeEntitiesByCourseId(courseId: courseId)
          .map((entities) =>
              entities.map((entity) => entity.toDomainModel()).toList()),
      shouldFetch: (data) {
        return true;
      },
      onFetchFailed: () async {},
    );
    yield* result.asStream();
  }

  @override
  Future<void> saveAssessmentAnswer({
    required String courseId,
    required String questionId,
    required AssessmentAnswer answer,
  }) async {
    final userId = (await _prefs.getUser())?.id ?? '';
    if (userId.isEmpty) {
      return;
    }

    switch (answer) {
      case AssessmentStringAnswer():
        logger.d('Saving assessment string answer: ${answer.answer}');
        await remoteDataSourceCall(
          () => _api.postAssessmentAnswer(
            courseId: courseId.toIntOrThrow(),
            assessmentQuestionId: questionId.toIntOrThrow(),
            answers: [answer.answer],
            userId: userId.toIntOrThrow(),
          ),
        );
      case AssessmentStringListAnswer():
        logger.d('Saving assessment string list answer: ${answer.answers}');
        await remoteDataSourceCall(
          () => _api.postAssessmentAnswer(
            courseId: courseId.toIntOrThrow(),
            assessmentQuestionId: questionId.toIntOrThrow(),
            answers: answer.answers,
            userId: userId.toIntOrThrow(),
          ),
        );
      case AssessmentStringMapAnswer():
        logger.d('Saving assessment string map answer: ${answer.answers}');
        await remoteDataSourceCall(
          () => _api.postAssessmentAnswer(
            courseId: courseId.toIntOrThrow(),
            assessmentQuestionId: questionId.toIntOrThrow(),
            answers: answer.answers.values.toList(),
            userId: userId.toIntOrThrow(),
          ),
        );
    }

    final userAnswer = await remoteDataSourceCall(
      () => _api.getAssessmentUserAnswer(
        courseId: courseId.toIntOrThrow(),
        assessmentQuestionId: questionId.toIntOrThrow(),
        userId: userId.toIntOrThrow(),
      ),
    );
    if (userAnswer != null) {
      final question = await _assessmentQuestionDao.observeEntity(id: questionId).first;
      final updatedQuestion = question?.copyWith(userAnswer: userAnswer.toEntity());
      if (updatedQuestion != null) {
        await _assessmentQuestionDao.upsertEntity(entity: updatedQuestion);
      }
    }
  }

  @override
  Future<AssessmentSubmissionResult> submitAssessment({
    required String courseId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.submitAssessment(
        courseId: courseId.toIntOrThrow(),
      ),
    );
    return result.toDomainModel();
  }
}
