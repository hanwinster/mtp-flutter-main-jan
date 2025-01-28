part of 'post_edit_bloc.dart';

@immutable
sealed class PostEditEvent extends Equatable {}

final class EditPostEvent extends PostEditEvent {
  final String post_id, group_id, description;
  final File? uploadedFile, uploadedVideo;
  EditPostEvent(
      {required this.post_id,
      required this.group_id,
      required this.description,
      this.uploadedFile,
      this.uploadedVideo});

  @override
  List<Object> get props =>
      [group_id, description, uploadedFile!, uploadedVideo!];
}

final class FectchUserEvent extends PostEditEvent {
  FectchUserEvent();

  @override
  List<Object> get props => [];
}
