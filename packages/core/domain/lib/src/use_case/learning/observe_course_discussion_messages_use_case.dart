import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseDiscussionMessagesUseCaseRequest extends Equatable {
  const ObserveCourseDiscussionMessagesUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object?> get props => [];
}

class ObserveCourseDiscussionMessagesUseCase {
  ObserveCourseDiscussionMessagesUseCase({
    CourseDiscussionMessageRepository? repository,
  }) : _repository = repository ?? getIt();

  final CourseDiscussionMessageRepository _repository;

  Stream<Result<List<CourseDiscussionMessage>>> call(
      ObserveCourseDiscussionMessagesUseCaseRequest request) {
    return _repository.observeDiscussionMessages(
      courseId: request.courseId,
    );
  }
}
