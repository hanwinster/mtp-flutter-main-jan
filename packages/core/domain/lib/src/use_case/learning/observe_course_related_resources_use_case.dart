import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseRelatedResourcesUseCaseRequest extends Equatable {
  final String courseId;

  const ObserveCourseRelatedResourcesUseCaseRequest({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}

class ObserveCourseRelatedResourcesUseCase {
  ObserveCourseRelatedResourcesUseCase({
    ResourceRepository? repository,
  }) : _repository = repository ?? getIt();

  final ResourceRepository _repository;

  Stream<Result<List<Resource>>> call(
      ObserveCourseRelatedResourcesUseCaseRequest request) {
    return _repository.observeResourcesByCourseId(
      courseId: request.courseId,
    );
  }
}
