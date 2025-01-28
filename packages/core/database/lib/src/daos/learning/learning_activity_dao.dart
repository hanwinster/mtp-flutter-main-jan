import 'package:database/database.dart';

abstract class LearningActivityDao {
  Future<void> upsertEntity({
    required LearningActivityEntity entity,
  });

  Stream<LearningActivityEntity?> observeEntity({
    required String id,
  });
}
