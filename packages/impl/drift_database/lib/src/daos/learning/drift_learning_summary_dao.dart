import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_learning_summary_dao.g.dart';

@DriftAccessor(tables: [
  LearningSummaryTable,
])
class DriftLearningSummaryDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftLearningSummaryDaoMixin
    implements LearningSummaryDao {
  DriftLearningSummaryDao(super.db);

  @override
  Stream<LearningSummaryEntity?> observeEntity({
    required String id,
  }) {
    final query = (select(learningSummaryTable)..where((tbl) => tbl.id.equals(id)));
    final stream = query.watchSingleOrNull();
    return stream.map((row) => row?.toEntity());
  }

  @override
  Future<void> upsertEntity({
    required LearningSummaryEntity entity,
  }) async {
    await into(learningSummaryTable).insertOnConflictUpdate(entity.toEntry());
  }
}
