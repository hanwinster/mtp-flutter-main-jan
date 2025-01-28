import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DeleteOfflineCourseMediaUseCaseRequest extends Equatable {
  final String id;

  const DeleteOfflineCourseMediaUseCaseRequest({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class DeleteOfflineCourseMediaUseCase {
  DeleteOfflineCourseMediaUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<void> call(DeleteOfflineCourseMediaUseCaseRequest request) {
    return _courseRepository.deleteOfflineCourseMedia(
      id: request.id,
    );
  }
}
