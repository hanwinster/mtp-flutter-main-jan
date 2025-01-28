import 'package:base/base.dart';

class CourseCategory extends Equatable {
  final String id;
  final String name;

  const CourseCategory({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}