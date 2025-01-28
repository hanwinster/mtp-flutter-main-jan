import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CourseDiscussionMessageRepository {
  Stream<Result<List<CourseDiscussionMessage>>> observeDiscussionMessages({
    required String courseId,
  });

  Future<void> createDiscussionMessage({
    required String courseId,
    required String discussionId,
    required String message,
  });
}
