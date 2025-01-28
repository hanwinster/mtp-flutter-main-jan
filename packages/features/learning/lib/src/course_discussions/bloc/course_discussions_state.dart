part of 'course_discussions_bloc.dart';

final class CourseDiscussionsState extends Equatable {
  const CourseDiscussionsState({
    required this.courseId,
    required this.discussionId,
    this.messagesUiState = const UiStateInitial(),
    this.messageState = const MessageState.unvalidated(),
    this.messageError,
    this.messageSubmissionState = const UiStateInitial(),
  });

  final String courseId;
  final String discussionId;
  final UiState<List<UiDiscussionMessageItem>> messagesUiState;
  final MessageState messageState;
  final FormFieldValidationError? messageError;
  final UiState<NullValue> messageSubmissionState;

  factory CourseDiscussionsState.create({
    required String courseId,
    required String discussionId,
  }) {
    return CourseDiscussionsState(
      courseId: courseId,
      discussionId: discussionId,
    );
  }

  @override
  List<Object?> get props => [
        courseId,
        discussionId,
        messagesUiState,
        messageState,
        messageError,
        messageSubmissionState,
      ];

  CourseDiscussionsState copyWith({
    String? courseId,
    String? discussionId,
    UiState<List<UiDiscussionMessageItem>>? messagesUiState,
    MessageState? messageState,
    ValueGetter<FormFieldValidationError?>? messageError,
    UiState<NullValue>? messageSubmissionState,
  }) {
    return CourseDiscussionsState(
      courseId: courseId ?? this.courseId,
      discussionId: discussionId ?? this.discussionId,
      messagesUiState: messagesUiState ?? this.messagesUiState,
      messageState: messageState ?? this.messageState,
      messageError: messageError != null ? messageError() : this.messageError,
      messageSubmissionState:
          messageSubmissionState ?? this.messageSubmissionState,
    );
  }
}
