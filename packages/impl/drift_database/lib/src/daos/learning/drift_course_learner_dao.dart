import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_course_learner_dao.g.dart';

@DriftAccessor(tables: [
  CourseLearnerTable,
])
class DriftCourseLearnerDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftCourseLearnerDaoMixin
    implements CourseLearnerDao {
  DriftCourseLearnerDao(super.db);

  @override
  Stream<CourseLearnerEntity?> observeEntity({
    required String entityId,
  }) {
    final query =
        (select(courseLearnerTable)..where((tbl) => tbl.id.equals(entityId)));
    final stream = query.watchSingleOrNull();
    return stream.map((entry) => entry?.toEntity());
  }

  @override
  Future<void> upsertEntity({required CourseLearnerEntity entity}) async {
    await into(courseLearnerTable).insertOnConflictUpdate(entity.toEntry());
  }

  @override
  Future<void> upsertEntities({
    required List<CourseLearnerEntity> entities,
  }) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        courseLearnerTable,
        entities.map((e) => e.toEntry()).toList(),
      );
    });
  }

  @override
  Future<void> deleteAllEntities() async {
    await delete(courseLearnerTable).go();
  }

  @override
  Future<CourseLearnerEntity?> getCourseLearnerByCourseId({
    required String courseId,
  }) async {
    final query = (select(courseLearnerTable)
          ..where((tbl) => tbl.courseId.equals(courseId)));
    final entry = await query.getSingleOrNull();
    return entry?.toEntity();
  }
}
