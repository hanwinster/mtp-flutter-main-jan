import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseLearnerUseCaseRequest extends Equatable {
  const ObserveCourseLearnerUseCaseRequest({
    required this.learnerId,
  });

  final String learnerId;

  @override
  List<Object?> get props => [learnerId];
}

class ObserveCourseLearnerUseCase {
  ObserveCourseLearnerUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Stream<Result<CourseLearner>> call(ObserveCourseLearnerUseCaseRequest request) {
    return _courseRepository.observeCourseLearner(
      learnerId: request.learnerId,
    );
  }
}
