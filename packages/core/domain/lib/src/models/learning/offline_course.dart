import 'package:base/base.dart';
import 'package:domain/domain.dart';

class OfflineCourse extends Equatable {
  final Course course;

  const OfflineCourse({
    required this.course,
  });

  @override
  List<Object> get props => [course];
}
