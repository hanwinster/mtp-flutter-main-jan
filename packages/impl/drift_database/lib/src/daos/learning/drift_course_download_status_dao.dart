import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_course_download_status_dao.g.dart';

@DriftAccessor(tables: [
  CourseDownloadStatusTable,
])
class DriftCourseDownloadStatusDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftCourseDownloadStatusDaoMixin
    implements CourseDownloadStatusDao {
  DriftCourseDownloadStatusDao(super.db);

  @override
  Stream<CourseDownloadStatusEntity?> observeEntity({
    required String courseId,
  }) {
    final query = (select(courseDownloadStatusTable)
      ..where(
        (tbl) => tbl.courseId.equals(courseId),
      ));
    final stream = query.watchSingleOrNull();
    return stream.map(
      (row) {
        if (row == null) {
          return null;
        }
        return row.toEntity();
      },
    );
  }

  @override
  Future<void> upsertEntity({
    required CourseDownloadStatusEntity entity,
  }) async {
    final entry = entity.toEntry();
    await into(courseDownloadStatusTable).insertOnConflictUpdate(entry);
  }

  @override
  Future<void> markAsHandled({
    required String courseId,
  }) async {
    await (update(courseDownloadStatusTable)
          ..where(
            (tbl) => tbl.courseId.equals(courseId),
          ))
        .write(
      const CourseDownloadStatusTableCompanion(
        isHandled: Value(true),
      ),
    );
  }

  @override
  Future<void> deleteEntity({
    required String courseId,
  }) async {
    await (delete(courseDownloadStatusTable)
          ..where(
            (tbl) => tbl.courseId.equals(courseId),
          ))
        .go();
  }
}
