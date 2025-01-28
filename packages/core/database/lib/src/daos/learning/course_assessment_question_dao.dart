import 'package:database/database.dart';

abstract class CourseAssessmentQuestionDao {
  Future<void> upsertEntities({
    required List<AssessmentQuestionEntity> entities,
  });

  Future<void> upsertEntity({
    required AssessmentQuestionEntity entity,
  });

  Stream<AssessmentQuestionEntity?> observeEntity({
    required String id,
  });

  Stream<List<AssessmentQuestionEntity>> observeEntitiesByCourseId({
    required String courseId,
  });

  Future<void> deleteAllByCourseId({
    required String courseId,
  });
}
