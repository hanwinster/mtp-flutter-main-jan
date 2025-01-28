import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/mappers/mappers.dart';

extension InsertCourseQuery on DatabaseAccessor {
  Future<void> insertCourse({
    required $CourseLearnerTableTable courseLearnerTable,
    required $UserCourseTableTable userCourseTable,
    required $CourseTableTable courseTable,
    required $LectureTableTable lectureTable,
    required $LearningActivityTableTable learningActivityTable,
    required $LearningSummaryTableTable learningSummaryTable,
    required $LearningQuizTableTable learningQuizTable,
    required $LiveSessionTableTable liveSessionTable,
    required $CourseAssessmentQuestionTableTable courseAssessmentQuestionTable,
    required CourseEntity entity,
  }) async {
    await batch((batch) {
      if (entity.courseLearner != null) {
        final newCourseLearner = entity.courseLearner!.toEntry();
        batch.insert(
          courseLearnerTable,
          newCourseLearner,
          onConflict: DoUpdate(
            (_) => newCourseLearner,
          ),
        );

        final userCourseRow = UserCourseTableCompanion.insert(
          courseId: entity.id,
          learnerId: entity.courseLearner!.id,
          createdAt: DateTime.now(),
        );
        batch.insert(
          userCourseTable,
          userCourseRow,
          onConflict: DoUpdate(
            (_) => userCourseRow,
          ),
        );
      }
      final newCourse = entity.toEntry();
      batch.insert(
        courseTable,
        newCourse,
        onConflict: DoUpdate(
          (_) => newCourse,
        ),
      );
      if (entity.lectures.isNotEmpty) {
        for (final lecture in entity.lectures) {
          final newLecture = lecture.toEntry();
          batch.insert(
            lectureTable,
            newLecture,
            onConflict: DoUpdate(
              (_) => newLecture,
            ),
          );
          if (lecture.learningActivities.isNotEmpty) {
            for (final learningActivity in lecture.learningActivities) {
              final newLearningActivity = learningActivity.toEntry();
              batch.insert(
                learningActivityTable,
                newLearningActivity,
                onConflict: DoUpdate(
                  (_) => newLearningActivity,
                ),
              );
            }
          }
          if (lecture.summaries.isNotEmpty) {
            for (final summary in lecture.summaries) {
              final newSummary = summary.toEntry();
              batch.insert(
                learningSummaryTable,
                newSummary,
                onConflict: DoUpdate(
                  (_) => newSummary,
                ),
              );
            }
          }
          if (lecture.quizzes.isNotEmpty) {
            for (final quiz in lecture.quizzes) {
              final newQuiz = quiz.toCompanion();
              batch.insert(
                learningQuizTable,
                newQuiz,
                onConflict: DoUpdate(
                  (_) => newQuiz,
                ),
              );
            }
          }
        }

        for (final lecture in entity.lectures) {
          if (lecture.learningActivities.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              learningActivityTable,
              lecture.learningActivities.map((e) => e.toEntry()).toList(),
            );
          }
        }
      }
      if (entity.learningActivities.isNotEmpty) {
        batch.insertAllOnConflictUpdate(
          learningActivityTable,
          entity.learningActivities.map((e) => e.toEntry()).toList(),
        );
      }
      if (entity.summaries.isNotEmpty) {
        batch.insertAllOnConflictUpdate(
          learningSummaryTable,
          entity.summaries.map((e) => e.toEntry()).toList(),
        );
      }
      if (entity.quizzes.isNotEmpty) {
        batch.insertAllOnConflictUpdate(
          learningQuizTable,
          entity.quizzes.map((e) => e.toCompanion()).toList(),
        );
      }
      if (entity.liveSessions.isNotEmpty) {
        batch.insertAllOnConflictUpdate(
          liveSessionTable,
          entity.liveSessions.map((e) => e.toEntry()).toList(),
        );
      }
      if (entity.assessmentQuestions.isNotEmpty) {
        batch.insertAllOnConflictUpdate(
          courseAssessmentQuestionTable,
          entity.assessmentQuestions.map((e) => e.toEntry()).toList(),
        );
      }
    });
  }
}
