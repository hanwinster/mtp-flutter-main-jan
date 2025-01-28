import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class OfflineCourseEntity extends Equatable {
  final CourseEntity course;

  const OfflineCourseEntity({
    required this.course,
  });

  @override
  List<Object?> get props => [course];


  OfflineCourse toDomainModel() {
    return OfflineCourse(
      course: course.toDomainModel(),
    );
  }

  OfflineCourseEntity copyWith({
    CourseEntity? course,
  }) {
    return OfflineCourseEntity(
      course: course ?? this.course,
    );
  }
}
