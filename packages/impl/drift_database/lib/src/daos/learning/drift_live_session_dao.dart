import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_live_session_dao.g.dart';

@DriftAccessor(tables: [
  LiveSessionTable,
])
class DriftLiveSessionDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftLiveSessionDaoMixin
    implements LiveSessionDao {
  DriftLiveSessionDao(super.db);

  @override
  Stream<LiveSessionEntity?> observeEntity({
    required String id,
  }) {
    final query = (select(liveSessionTable)..where((tbl) => tbl.id.equals(id)));
    final stream = query.watchSingleOrNull();
    return stream.map((row) => row?.toEntity());
  }

  @override
  Future<void> upsertEntity({
    required LiveSessionEntity entity,
  }) async {
    await into(liveSessionTable).insertOnConflictUpdate(entity.toEntry());
  }
}
