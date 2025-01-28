import 'package:base/base.dart';

final class CourseType extends Equatable {
  final String id;
  final String name;

  const CourseType({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}