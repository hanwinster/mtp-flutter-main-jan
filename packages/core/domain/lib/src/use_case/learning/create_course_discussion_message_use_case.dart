import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateCourseDiscussionMessageUseCaseRequest extends Equatable {
  const CreateCourseDiscussionMessageUseCaseRequest({
    required this.courseId,
    required this.discussionId,
    required this.message,
  });

  final String courseId;
final String discussionId;
  final String message;

  @override
  List<Object?> get props => [
        courseId,
        discussionId,
        message,
      ];
}

class CreateCourseDiscussionMessageUseCase {
  CreateCourseDiscussionMessageUseCase({
    CourseDiscussionMessageRepository? repository,
  }) : _repository = repository ?? getIt();

  final CourseDiscussionMessageRepository _repository;

  Future<void> call(CreateCourseDiscussionMessageUseCaseRequest request) {
    return _repository.createDiscussionMessage(
      courseId: request.courseId,
      discussionId: request.discussionId,
      message: request.message,
    );
  }
}
