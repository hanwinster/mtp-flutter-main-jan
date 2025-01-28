import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class LectureRepository {
  Stream<Result<Lecture>> observeLecture({
    required String courseId,
    required String lectureId,
  });
}
