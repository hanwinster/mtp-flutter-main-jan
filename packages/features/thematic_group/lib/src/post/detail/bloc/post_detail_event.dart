part of 'post_detail_bloc.dart';

sealed class PostDetailEvent extends Equatable {}

class PostDetailFetched extends PostDetailEvent {
  PostDetailFetched();

  @override
  List<Object?> get props => [];
}

class PostDelete extends PostDetailEvent {
  final String postId;

  PostDelete({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class ReactToComment extends PostDetailEvent {
  final int groupId;
  final int reaction_to_id;
  final String reaction_type;
  final String reaction_to_type;

  ReactToComment(
      {required this.groupId,
      required this.reaction_to_id,
      required this.reaction_type,
      required this.reaction_to_type});

  @override
  List<Object?> get props => [groupId, reaction_to_id, reaction_type];
}
