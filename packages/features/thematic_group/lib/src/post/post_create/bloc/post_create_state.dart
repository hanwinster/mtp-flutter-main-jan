part of 'post_create_bloc.dart';

class PostCreateState extends Equatable {
  const PostCreateState({
    this.description = '',
    this.attachedFile,
    this.attachedVideo,
    this.postSubmissionUiState = const UiStateInitial(),
    this.userUiState = const UiStateInitial(),
  });

  final UiState<NullValue> postSubmissionUiState;
  final UiState<User?> userUiState;
  final String description;
  final File? attachedFile;
  final File? attachedVideo;

  factory PostCreateState.create() {
    return const PostCreateState();
  }

  @override
  List<Object?> get props => [
    description,
    attachedFile,
    attachedVideo,
    postSubmissionUiState,
  ];

  PostCreateState copyWith({
    UiState<NullValue>? postSubmissionUiState,
    UiState<User>? userUiState,
    String? description,
    File? attachedFile,
    File? attachedVideo,
  }) {
    return PostCreateState(
      postSubmissionUiState: postSubmissionUiState ??
          this.postSubmissionUiState,
      userUiState: userUiState ?? this.userUiState,
      description: description ?? this.description,
      attachedFile: attachedFile ?? this.attachedFile,
      attachedVideo: attachedVideo ?? this.attachedVideo,
    );
  }
}
