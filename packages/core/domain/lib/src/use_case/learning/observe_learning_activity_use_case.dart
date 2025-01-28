import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLearningActivityUseCaseRequest extends Equatable {
  const ObserveLearningActivityUseCaseRequest({
    required this.courseId,
    required this.activityId,
  });

  final String courseId;
  final String activityId;

  @override
  List<Object?> get props => [courseId, activityId];
}

class ObserveLearningActivityUseCase {
  ObserveLearningActivityUseCase({
    LearningActivityRepository? learningActivityRepository,
  }) : _learningActivityRepository = learningActivityRepository ?? getIt();

  final LearningActivityRepository _learningActivityRepository;

  Stream<Result<LearningActivity?>> call(
      ObserveLearningActivityUseCaseRequest request) {
    return _learningActivityRepository.observeLearningActivity(
      courseId: request.courseId,
      activityId: request.activityId,
    );
  }
}
