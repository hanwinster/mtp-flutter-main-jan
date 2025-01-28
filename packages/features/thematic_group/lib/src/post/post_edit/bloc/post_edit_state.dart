part of 'post_edit_bloc.dart';

class PostEditState extends Equatable {
  const PostEditState({
    required this.postId,
    this.postUiState = const UiStateInitial(),
    this.formSubmissionUiState = const UiStateInitial(),
    this.userUiState = const UiStateInitial(),
    this.description = '',
    this.attachedFile,
    this.attachedVideo,
  });

  factory PostEditState.create({
    required String postId,
  }) {
    return PostEditState(
      postId: postId,
    );
  }

  final String postId;
  final UiState<ThematicGroupPost> postUiState;

  final UiState<NullValue> formSubmissionUiState;
  final UiState<User?> userUiState;
  final String description;
  final File? attachedFile;
  final File? attachedVideo;

  @override
  List<Object?> get props => [
        formSubmissionUiState,
        description,
        attachedFile,
        attachedVideo,
      ];

  PostEditState copyWith({
    String? postId,
    UiState<ThematicGroupPost>? postUiState,
    UiState<NullValue>? formSubmissionUiState,
    UiState<User>? userUiState,
    String? description,
    File? attachedFile,
    File? attachedVideo,
  }) {
    return PostEditState(
      postId: postId ?? this.postId,
      postUiState: postUiState ?? this.postUiState,
      formSubmissionUiState:
          formSubmissionUiState ?? this.formSubmissionUiState,
      userUiState: userUiState ?? this.userUiState,
      description: description ?? this.description,
      attachedFile: attachedFile ?? this.attachedFile,
      attachedVideo: attachedVideo ?? this.attachedVideo,
    );
  }
}
