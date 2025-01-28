import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UiCourseNavigationResult extends Equatable {
  final CourseNavigationDirection direction;
  final CourseMaterial material;

  const UiCourseNavigationResult({
    required this.direction,
    required this.material,
  });

  @override
  List<Object> get props => [direction, material];

  UiCourseNavigationResult copyWith({
    CourseNavigationDirection? direction,
    CourseMaterial? material,
  }) {
    return UiCourseNavigationResult(
      direction: direction ?? this.direction,
      material: material ?? this.material,
    );
  }
}