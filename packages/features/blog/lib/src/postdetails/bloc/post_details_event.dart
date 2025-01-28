part of 'post_details_bloc.dart';

sealed class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();
}

class PostDetailsFetched extends PostDetailsEvent {
  const PostDetailsFetched();

  @override
  List<Object> get props => [];
}

class PostDetailsPostReactionChanged extends PostDetailsEvent {
  const PostDetailsPostReactionChanged({
    required this.oldReaction,
    required this.newReaction,
  });

  final ReactionType? oldReaction;
  final ReactionType newReaction;

  @override
  List<Object?> get props => [oldReaction, newReaction];
}


class PostDetailsCommentReactionChanged extends PostDetailsEvent {
  const PostDetailsCommentReactionChanged({
    required this.commentId,
    required this.currentReaction,
    required this.newReactionType,
  });

  final String commentId;
  final Reaction? currentReaction;
  final ReactionType newReactionType;

  @override
  List<Object?> get props => [commentId, currentReaction, newReactionType];
}


class PostDetailsFilteredPostsFetched extends PostDetailsEvent {
  const PostDetailsFilteredPostsFetched(this.category);

  final BlogPostCategory? category;

  @override
  List<Object?> get props => [category];
}

class PostDetailsRecommendedPostsFetched extends PostDetailsEvent {
  const PostDetailsRecommendedPostsFetched();

  @override
  List<Object?> get props => [];
}

class PostDetailsCategoriesFetched extends PostDetailsEvent {
  const PostDetailsCategoriesFetched();

  @override
  List<Object> get props => [];
}

class PostDetailsCategoryToggled extends PostDetailsEvent {
  const PostDetailsCategoryToggled(this.item);

  final SelectableCategoryItemState item;

  @override
  List<Object> get props => [item];
}

class PostDetailsCommentsFetched extends PostDetailsEvent {
  const PostDetailsCommentsFetched();

  @override
  List<Object> get props => [];
}

class PostDetailsPostShareTracked extends PostDetailsEvent {
  const PostDetailsPostShareTracked();

  @override
  List<Object> get props => [];
}

class PostDetailsMarkAsReadRequested extends PostDetailsEvent {
  const PostDetailsMarkAsReadRequested();

  @override
  List<Object> get props => [];
}

class PostDetailsCommentDeleted extends PostDetailsEvent {
  const PostDetailsCommentDeleted(this.commentId);
  final String commentId;

  @override
  List<Object> get props => [commentId];
}
