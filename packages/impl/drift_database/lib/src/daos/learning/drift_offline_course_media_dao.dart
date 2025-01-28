import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_offline_course_media_dao.g.dart';

@DriftAccessor(tables: [
  OfflineCourseMediaTable,
])
class DriftOfflineCourseMediaDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftOfflineCourseMediaDaoMixin
    implements OfflineCourseMediaDao {
  DriftOfflineCourseMediaDao(super.db);

  @override
  Stream<List<OfflineCourseMediaEntity>> observeEntities() {
    return select(offlineCourseMediaTable).watch().map(
          (rows) => rows.map((entry) => entry.toEntity()).toList(),
        );
  }

  @override
  Future<void> upsertEntity({
    required OfflineCourseMediaEntity entity,
  }) async {
    await into(offlineCourseMediaTable).insert(
      entity.toCompanion(),
      onConflict: DoUpdate((_) => entity.toCompanion()),
    );
  }

  @override
  Future<void> deleteEntity({
    required String id,
  }) async {
    await (delete(offlineCourseMediaTable)
          ..where(
            (tbl) => tbl.id.equals(int.parse(id)),
          ))
        .go();
  }
}
