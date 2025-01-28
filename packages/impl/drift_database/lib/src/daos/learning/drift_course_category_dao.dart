import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_course_category_dao.g.dart';

@DriftAccessor(tables: [
  CourseCategoryTable,
])
class DriftCourseCategoryDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftCourseCategoryDaoMixin
    implements CourseCategoryDao {
  DriftCourseCategoryDao(super.db);

  @override
  Stream<List<CourseCategoryEntity>> observeEntities() {
    return select(courseCategoryTable).watch().map((entries) {
      return entries.map((entry) => entry.toEntity()).toList();
    });
  }

  @override
  Future<void> upsertEntities({
    required List<CourseCategoryEntity> entities,
  }) async {
    await batch(
      (batch) {
        batch.insertAllOnConflictUpdate(
          courseCategoryTable,
          entities.map((e) => e.toCompanion()).toList(),
        );
      },
    );
  }

  @override
  Future<void> deleteAllEntities() async {
    await delete(courseCategoryTable).go();
  }
}
