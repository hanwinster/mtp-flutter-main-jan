import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetXApiCourseUseCaseRequest extends Equatable {
  const GetXApiCourseUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object?> get props => [courseId];
}

class GetXApiCourseUseCase {
  GetXApiCourseUseCase({
    CourseRepository? courseRepository,
  }) : _courseRepository = courseRepository ?? getIt();

  final CourseRepository _courseRepository;

  Future<XApiCourse> call(GetXApiCourseUseCaseRequest request) {
    return _courseRepository.getXApiCourse(
      courseId: request.courseId,
    );
  }
}
