import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:rxdart/rxdart.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_lecture_dao.g.dart';

@DriftAccessor(tables: [
  LectureTable,
  LearningActivityTable,
  LearningSummaryTable,
  LearningQuizTable,
  LiveSessionTable,
])
class DriftLectureDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftLectureDaoMixin
    implements LectureDao {
  DriftLectureDao(super.db);

  @override
  Stream<LectureEntity?> observeEntity({
    required String id,
  }) {
    final lectureQuery =
        (select(lectureTable)..where((tbl) => tbl.id.equals(id)));
    final lectureStream = lectureQuery.watchSingleOrNull();

    final learningActivityQuery = (select(learningActivityTable)
      ..where((tbl) => tbl.lectureId.equals(id)));
    final learningActivityStream = learningActivityQuery.watch();

    final learningSummaryQuery = (select(learningSummaryTable)
      ..where((tbl) => tbl.lectureId.equals(id)));
    final learningSummaryStream = learningSummaryQuery.watch();

    final learningQuizQuery = (select(learningQuizTable)
      ..where((tbl) => tbl.lectureId.equals(id)));
    final learningQuizStream = learningQuizQuery.watch();

    final liveSessionQuery = (select(liveSessionTable)
      ..where((tbl) => tbl.lectureId.equals(id)));
    final liveSessionsStream = liveSessionQuery.watch();

    return Rx.combineLatest5(
      lectureStream,
      learningActivityStream,
      learningSummaryStream,
      learningQuizStream,
      liveSessionsStream,
      (lecture, learningActivities, summaries, quizzes, liveSessions) {
        return lecture?.toEntity(
          learningActivities:
              learningActivities.map((entry) => entry.toEntity()).toList(),
          summaries: summaries.map((entry) => entry.toEntity()).toList(),
          quizzes: quizzes.map((entry) => entry.toEntity()).toList(),
          liveSessions: liveSessions.map((entry) => entry.toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<void> upsertEntity({
    required LectureEntity entity,
  }) async {
    await into(lectureTable).insertOnConflictUpdate(entity.toEntry());
  }
}
