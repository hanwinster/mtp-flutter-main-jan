import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_course_assessment_question_dao.g.dart';

@DriftAccessor(tables: [
  CourseAssessmentQuestionTable,
])
class DriftCourseAssessmentQuestionDao
    extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftCourseAssessmentQuestionDaoMixin
    implements CourseAssessmentQuestionDao {
  DriftCourseAssessmentQuestionDao(super.db);

  @override
  Stream<AssessmentQuestionEntity?> observeEntity({
    required String id,
  }) {
    final query = (select(courseAssessmentQuestionTable)
      ..where((tbl) => tbl.id.equals(id)));
    final stream = query.watchSingleOrNull();
    return stream.map((row) => row?.toEntity());
  }

  @override
  Stream<List<AssessmentQuestionEntity>> observeEntitiesByCourseId({
    required String courseId,
  }) {
    final query = (select(courseAssessmentQuestionTable)
          // ..orderBy([
          //   (tbl) => OrderingTerm(expression: tbl.order, mode: OrderingMode.asc)
          // ])
          ..where((tbl) => tbl.courseId.equals(courseId)))
        .watch();
    return query.map((rows) => rows.map((row) => row.toEntity()).toList());
  }

  @override
  Future<void> upsertEntity({
    required AssessmentQuestionEntity entity,
  }) async {
    await into(courseAssessmentQuestionTable)
        .insertOnConflictUpdate(entity.toEntry());
  }

  @override
  Future<void> upsertEntities({
    required List<AssessmentQuestionEntity> entities,
  }) async {
    await batch(
      (batch) {
        batch.insertAllOnConflictUpdate(
          courseAssessmentQuestionTable,
          entities.map((e) => e.toEntry()).toList(),
        );
      },
    );
  }

  @override
  Future<void> deleteAllByCourseId({
    required String courseId,
  }) async {
    await (delete(courseAssessmentQuestionTable)
          ..where((tbl) => tbl.courseId.equals(courseId)))
        .go();
  }
}
