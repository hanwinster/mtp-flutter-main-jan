part of 'group_post_comment_list_bloc.dart';

sealed class GroupPostCommentListEvent extends Equatable {
  const GroupPostCommentListEvent();
}

class GroupPostCommentListFetched extends GroupPostCommentListEvent {
  const GroupPostCommentListFetched();

  @override
  List<Object> get props => [];
}

class GroupPostCommentAdded extends GroupPostCommentListEvent {
  const GroupPostCommentAdded(this.comment);

  final ThematicGroupPostComment comment;

  @override
  List<Object> get props => [comment];
}

class GroupPostCommentUpdated extends GroupPostCommentListEvent {
  const GroupPostCommentUpdated(this.comment);

  final ThematicGroupPostComment comment;

  @override
  List<Object> get props => [comment];
}

class GroupPostCommentReplyAdded extends GroupPostCommentListEvent {
  const GroupPostCommentReplyAdded(this.reply);

  final ThematicGroupPostCommentReply reply;

  @override
  List<Object> get props => [reply];
}

class GroupPostCommentReplyUpdated extends GroupPostCommentListEvent {
  const GroupPostCommentReplyUpdated(this.reply);

  final ThematicGroupPostCommentReply reply;

  @override
  List<Object> get props => [reply];
}

class GroupPostCommentReactionChanged extends GroupPostCommentListEvent {
  const GroupPostCommentReactionChanged({
    required this.reactionToId,
    required this.reactionToType,
    required this.currentReaction,
    required this.newReactionType,
  });

  final String reactionToId;
  final ThematicGroupReactionToType reactionToType;
  final Reaction? currentReaction;
  final ReactionType newReactionType;

  @override
  List<Object?> get props => [
        reactionToId,
        reactionToType,
        currentReaction,
        newReactionType,
      ];
}

class GroupPostCommentDeleted extends GroupPostCommentListEvent {
  const GroupPostCommentDeleted(this.commentId);

  final String commentId;

  @override
  List<Object> get props => [commentId];
}

class GroupPostCommentReplyDeleted extends GroupPostCommentListEvent {
  const GroupPostCommentReplyDeleted(this.replyId);

  final String replyId;

  @override
  List<Object> get props => [replyId];
}
