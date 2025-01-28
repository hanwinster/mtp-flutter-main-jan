import 'package:database/database.dart';

abstract class LectureDao {
  Future<void> upsertEntity({
    required LectureEntity entity,
  });

  Stream<LectureEntity?> observeEntity({
    required String id,
  });
}
