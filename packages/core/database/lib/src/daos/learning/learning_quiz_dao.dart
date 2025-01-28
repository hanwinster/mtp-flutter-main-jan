import 'package:database/database.dart';

abstract class LearningQuizDao {
  Future<void> upsertEntity({
    required LearningQuizEntity entity,
  });

  Stream<LearningQuizEntity?> observeEntity({
    required String id,
  });
}
