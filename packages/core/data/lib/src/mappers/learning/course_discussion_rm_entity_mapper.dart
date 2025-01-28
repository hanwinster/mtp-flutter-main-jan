import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseDiscussionRMEntityMapper on CourseDiscussionRM {
  CourseDiscussionEntity toEntity() {
    return CourseDiscussionEntity(
      id: id?.toString() ?? (throw Exception("id is null")),
      courseId: courseId?.toString() ?? '',
      title: title ?? '',
      description: description ?? '',
      allowTakers: allowTakers == 1,
      allowLearners: allowLearners == 1,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }
}
