import 'package:database/database.dart';
import 'package:database/src/entities/learning/course_learner_entity.dart';

abstract class CourseLearnerDao {
  Stream<CourseLearnerEntity?> observeEntity({
    required String entityId,
  });

  Future<void> upsertEntities({
    required List<CourseLearnerEntity> entities,
  });

  Future<void> upsertEntity({
    required CourseLearnerEntity entity,
  });

  Future<void> deleteAllEntities();

  Future<CourseLearnerEntity?> getCourseLearnerByCourseId({
    required String courseId,
  });
}
