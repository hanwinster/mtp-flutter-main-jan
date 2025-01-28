part of 'post_create_bloc.dart';


sealed class PostCreateEvent extends Equatable {}

final class PostCreateUserFetched extends PostCreateEvent {
  PostCreateUserFetched();

  @override
  List<Object> get props => [];
}

final class PostCreateSubmitted extends PostCreateEvent {
  final String groupId;
  final String description;
  final File? uploadedFile;
  final File? uploadedVideo;

  PostCreateSubmitted({
    required this.groupId,
    required this.description,
    this.uploadedFile,
    this.uploadedVideo,
  });

  @override
  List<Object?> get props => [
        groupId,
        description,
        uploadedFile,
        uploadedVideo,
      ];
}
