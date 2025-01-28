import 'package:base/base.dart';

class CourseDiscussion extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool allowTakers;
  final bool allowLearners;

  const CourseDiscussion({
    required this.id,
    required this.title,
    required this.description,
    required this.allowTakers,
    required this.allowLearners,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        description,
        allowTakers,
        allowLearners,
      ];
}


