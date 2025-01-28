part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostsFetched extends PostsEvent {
  final String groupId;
  final int? page;
  final int? pageSize;

  const PostsFetched({required this.groupId, this.pageSize, this.page});

  @override
  List<Object?> get props => [groupId, pageSize, page];
}

class PostGPDelete extends PostsEvent {
  final String postId;
  final String groupId; // Add groupId

  const PostGPDelete({
    required this.postId,
    required this.groupId,
  });
}

class ReactToPost extends PostsEvent {
  final int groupId;
  final int postId;
  final ReactionType reaction_type;

  const ReactToPost(
      {required this.groupId,
      required this.postId,
      required this.reaction_type});

  @override
  List<Object?> get props => [groupId, postId, reaction_type];
}
class UnReactToPost extends PostsEvent {
  final int groupId;
  final int postId;
  final String reaction_type;

  const UnReactToPost(
      {required this.groupId,
      required this.postId,
      required this.reaction_type});

  @override
  List<Object?> get props => [groupId, postId, reaction_type];
}
 

class PostsLoadMore extends PostsEvent {
  final String groupId;
  final int pageSize;

  const PostsLoadMore({required this.groupId, required this.pageSize});

  @override
  List<Object?> get props => [groupId, pageSize];
}
