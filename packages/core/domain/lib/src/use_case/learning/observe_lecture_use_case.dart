import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLectureUseCaseRequest extends Equatable {
  const ObserveLectureUseCaseRequest({
    required this.courseId,
    required this.lectureId,
  });
  final String courseId;
  final String lectureId;

  @override
  List<Object?> get props => [courseId, lectureId];
}

class ObserveLectureUseCase {
  ObserveLectureUseCase({
    LectureRepository? lectureRepository,
  }) : _lectureRepository =
        lectureRepository ?? getIt();

  final LectureRepository _lectureRepository;

  Stream<Result<Lecture>> call(ObserveLectureUseCaseRequest request) {
    return _lectureRepository.observeLecture(
      courseId: request.courseId,
      lectureId: request.lectureId,
    );
  }
}