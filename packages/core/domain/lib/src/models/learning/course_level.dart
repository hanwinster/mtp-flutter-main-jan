import 'package:base/base.dart';

final class CourseLevel extends Equatable {
  final String id;
  final String name;
  final String value;

  const CourseLevel({
    required this.id,
    required this.name,
    required this.value,
  });

  @override
  List<Object?> get props => [id, name, value];
}