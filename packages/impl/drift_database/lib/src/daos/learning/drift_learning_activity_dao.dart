import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_learning_activity_dao.g.dart';

@DriftAccessor(tables: [
  LearningActivityTable,
])
class DriftLearningActivityDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftLearningActivityDaoMixin
    implements LearningActivityDao {
  DriftLearningActivityDao(super.db);

  @override
  Stream<LearningActivityEntity?> observeEntity({
    required String id,
  }) {
    final query = (select(learningActivityTable)..where((tbl) => tbl.id.equals(id)));
    final stream = query.watchSingleOrNull();
    return stream.map((row) => row?.toEntity());
  }

  @override
  Future<void> upsertEntity({
    required LearningActivityEntity entity,
  }) async {
    await into(learningActivityTable).insertOnConflictUpdate(entity.toEntry());
  }
}
