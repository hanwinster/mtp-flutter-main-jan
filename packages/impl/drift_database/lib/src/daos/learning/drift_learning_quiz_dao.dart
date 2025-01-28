import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_learning_quiz_dao.g.dart';

@DriftAccessor(tables: [
  LearningQuizTable,
])
class DriftLearningQuizDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftLearningQuizDaoMixin
    implements LearningQuizDao {
  DriftLearningQuizDao(super.db);

  @override
  Stream<LearningQuizEntity?> observeEntity({
    required String id,
  }) {
    final query =
        (select(learningQuizTable)..where((tbl) => tbl.id.equals(id)));
    final stream = query.watchSingleOrNull();
    return stream.map((row) => row?.toEntity());
  }

  @override
  Future<void> upsertEntity({
    required LearningQuizEntity entity,
  }) async {
    await into(learningQuizTable).insertOnConflictUpdate(entity.toCompanion());
  }
}
