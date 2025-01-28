import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class LearningActivityRepository {
  Stream<Result<LearningActivity>> observeLearningActivity({
    required String courseId,
    required String activityId,
  });
}
