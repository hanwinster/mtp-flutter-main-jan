import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_post_comment_list/models/models.dart';
import 'package:ui/ui.dart';

part 'group_post_comment_list_event.dart';

part 'group_post_comment_list_state.dart';

class GroupPostCommentListBloc
    extends Bloc<GroupPostCommentListEvent, GroupPostCommentListState> {
  GroupPostCommentListBloc({
    required String postId,
    required String groupId,
    ObserveThematicGroupPostCommentsUseCase?
        observeThematicGroupPostCommentsUseCase,
    GetCurrentUserIdUseCase? getCurrentUserIdUseCase,
    DeleteGroupPostCommentUseCase? deleteGroupPostCommentUseCase,
    DeleteGroupPostReplyUseCase? deleteGroupPostReplyUseCase,
    CreateGroupPostReactionUseCase? createGroupPostReactionUseCase,
    UpdateGroupPostReactionUseCase? updateGroupPostReactionUseCase,
    DeleteGroupPostReactionUseCase? deleteGroupPostReactionUseCase,
  })  : _observeThematicGroupPostCommentsUseCase =
            observeThematicGroupPostCommentsUseCase ?? getIt(),
        _deleteGroupPostCommentUseCase =
            deleteGroupPostCommentUseCase ?? getIt(),
        _deleteGroupPostReplyUseCase = deleteGroupPostReplyUseCase ?? getIt(),
        _getCurrentUserIdUseCase = getCurrentUserIdUseCase ?? getIt(),
        _createGroupPostReactionUseCase =
            createGroupPostReactionUseCase ?? getIt(),
        _updateGroupPostReactionUseCase =
            updateGroupPostReactionUseCase ?? getIt(),
        _deleteGroupPostReactionUseCase =
            deleteGroupPostReactionUseCase ?? getIt(),
        super(GroupPostCommentListState(
          postId: postId,
          groupId: groupId,
        )) {
    on<GroupPostCommentListFetched>(
      _handleCommentsFetched,
      transformer: restartable(),
    );
    on<GroupPostCommentDeleted>(
      _handleCommentDeleted,
    );
    on<GroupPostCommentReplyDeleted>(
      _handleReplyDeleted,
    );
    on<GroupPostCommentAdded>(
      _handleCommentAdded,
    );
    on<GroupPostCommentUpdated>(
      _handleCommentUpdated,
    );
    on<GroupPostCommentReplyAdded>(
      _handleReplyAdded,
    );
    on<GroupPostCommentReplyUpdated>(
      _handleReplyUpdated,
    );
    on<GroupPostCommentReactionChanged>(
      _handleReactionChanged,
    );
  }

  final ObserveThematicGroupPostCommentsUseCase
      _observeThematicGroupPostCommentsUseCase;
  final DeleteGroupPostCommentUseCase _deleteGroupPostCommentUseCase;
  final DeleteGroupPostReplyUseCase _deleteGroupPostReplyUseCase;
  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;

  final CreateGroupPostReactionUseCase _createGroupPostReactionUseCase;
  final UpdateGroupPostReactionUseCase _updateGroupPostReactionUseCase;
  final DeleteGroupPostReactionUseCase _deleteGroupPostReactionUseCase;

  FutureOr<void> _handleCommentsFetched(
    GroupPostCommentListFetched event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    emit(
      state.copyWith(
        commentsUiState: const UiStateInProgress(),
      ),
    );

    final currentUserId = await _getCurrentUserIdUseCase();
    await emit.forEach(
      _observeThematicGroupPostCommentsUseCase(
          ObserveThematicGroupPostCommentsUseCaseRequest(
        postId: state.postId,
      )),
      onData: (result) {
        return state.copyWith(
            commentsUiState: UiState.fromResultTransform(
          result,
          (comments) {
            return comments.map((comment) {
              return UiGroupPostCommentListItem(
                comment: comment,
                isOwner: _isCommentOwner(comment.user, currentUserId),
                replies: comment.commentReplies
                    .map((reply) => UiGroupPostCommentReplyListItem(
                          reply: reply,
                          isOwner: reply.user.id == currentUserId,
                        ))
                    .toList(),
              );
            }).toList();
          },
        ));
      },
      onError: (e, s) => state.copyWith(
        commentsUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  bool _isCommentOwner(User? commentOwner, String currentUserId) {
    if (commentOwner == null || currentUserId.isEmpty) {
      return false;
    }
    return commentOwner.id == currentUserId;
  }

  Future<void> _handleCommentDeleted(
    GroupPostCommentDeleted event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    try {
      await _deleteGroupPostCommentUseCase(
        commentId: event.commentId,
      );

      final items = List<UiGroupPostCommentListItem>.from(
          state.commentsUiState.dataOrNull ?? []);
      final updatedItems =
          items.where((item) => item.comment.id != event.commentId).toList();
      emit(
        state.copyWith(
          commentsUiState: UiStateSuccess(updatedItems),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to delete comment', e, s);
    }
  }

  Future<void> _handleCommentAdded(
    GroupPostCommentAdded event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    final currentUserId = await _getCurrentUserIdUseCase();
    final items = List<UiGroupPostCommentListItem>.from(
        state.commentsUiState.dataOrNull ?? []);
    final updatedItems = items
      ..insert(
        0,
        UiGroupPostCommentListItem(
          comment: event.comment,
          isOwner: _isCommentOwner(event.comment.user, currentUserId),
          replies: const [],
        ),
      );
    emit(
      state.copyWith(
        commentsUiState: UiStateSuccess(updatedItems),
      ),
    );
  }

  Future<void> _handleCommentUpdated(
    GroupPostCommentUpdated event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    final currentUserId = await _getCurrentUserIdUseCase();
    final items = List<UiGroupPostCommentListItem>.from(
        state.commentsUiState.dataOrNull ?? []);
    final updatedItems = items.map((item) {
      if (item.comment.id == event.comment.id) {
        return UiGroupPostCommentListItem(
          comment: event.comment,
          isOwner: _isCommentOwner(event.comment.user, currentUserId),
          replies: item.replies.sortedBy((reply) => reply.reply.createdAt),
        );
      }
      return item;
    }).toList();
    emit(
      state.copyWith(
        commentsUiState: UiStateSuccess(updatedItems),
      ),
    );
  }

  Future<void> _handleReplyAdded(
    GroupPostCommentReplyAdded event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    final currentUserId = await _getCurrentUserIdUseCase();
    final items = List<UiGroupPostCommentListItem>.from(
        state.commentsUiState.dataOrNull ?? []);
    final updatedItems = items.map((item) {
      if (item.comment.id == event.reply.commentId) {
        final updatedReplies =
            List<UiGroupPostCommentReplyListItem>.from(item.replies)
              ..add(
                UiGroupPostCommentReplyListItem(
                  reply: event.reply,
                  isOwner: event.reply.user.id == currentUserId,
                ),
              );
        return item.copyWith(replies: updatedReplies);
      }
      return item;
    }).toList();
    emit(
      state.copyWith(
        commentsUiState: UiStateSuccess(updatedItems),
      ),
    );
  }

  Future<void> _handleReplyUpdated(
    GroupPostCommentReplyUpdated event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    final currentUserId = await _getCurrentUserIdUseCase();
    final items = List<UiGroupPostCommentListItem>.from(
        state.commentsUiState.dataOrNull ?? []);
    final updatedItems = items.map((item) {
      final updatedReplies = item.replies.map((reply) {
        if (reply.reply.id == event.reply.id) {
          return reply.copyWith(reply: event.reply);
        }
        return reply;
      }).toList();
      return item.copyWith(replies: updatedReplies);
    }).toList();
    emit(
      state.copyWith(
        commentsUiState: UiStateSuccess(updatedItems),
      ),
    );
  }

  Future<void> _handleReplyDeleted(
    GroupPostCommentReplyDeleted event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    try {
      await _deleteGroupPostReplyUseCase(
        replyId: event.replyId,
      );

      final items = List<UiGroupPostCommentListItem>.from(
          state.commentsUiState.dataOrNull ?? []);
      final updatedItems = items.map((item) {
        final updatedReplies = item.replies
            .where((reply) => reply.reply.id != event.replyId)
            .toList();
        return item.copyWith(replies: updatedReplies);
      }).toList();
      emit(
        state.copyWith(
          commentsUiState: UiStateSuccess(updatedItems),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to delete reply', e, s);
    }
  }

  FutureOr<void> _handleReactionChanged(
    GroupPostCommentReactionChanged event,
    Emitter<GroupPostCommentListState> emit,
  ) async {
    try {
      final currentReaction = event.currentReaction;
      final reactionToId = event.reactionToId;
      if (currentReaction == null) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        final result = await createReaction(
          reactionToId: reactionToId,
          reactionToType: event.reactionToType,
          reactionType: event.newReactionType,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(NullValue()),
          commentsUiState: UiStateSuccess(
            state.commentsUiState.dataOrNull?.map((item) {
                  if (event.reactionToType ==
                      ThematicGroupReactionToType.comment) {
                    if (item.comment.id == reactionToId) {
                      return item.copyWith(
                        comment: item.comment.copyWith(
                          numberOfReactions: item.comment.numberOfReactions + 1,
                          userReaction: result,
                        ),
                      );
                    }
                  } else if (event.reactionToType ==
                      ThematicGroupReactionToType.replyToComment) {
                    final updatedReplies = item.replies.map((reply) {
                      if (reply.reply.id == reactionToId) {
                        return reply.copyWith(
                          reply: reply.reply.copyWith(
                            numberOfReactions:
                                reply.reply.numberOfReactions + 1,
                            userReaction: result,
                          ),
                        );
                      }
                      return reply;
                    }).toList();
                    return item.copyWith(replies: updatedReplies);
                  }
                  return item;
                }).toList() ??
                [],
          ),
        ));
        return;
      }

      final oldReaction = currentReaction.reactionType;
      if (oldReaction == event.newReactionType) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        await deleteReaction(
          currentReaction: currentReaction,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(NullValue()),
          commentsUiState: UiStateSuccess(
            state.commentsUiState.dataOrNull?.map((item) {
                  if (event.reactionToType ==
                      ThematicGroupReactionToType.comment) {
                    if (item.comment.id == reactionToId) {
                      return item.copyWith(
                        comment: item.comment.copyWith(
                          numberOfReactions: item.comment.numberOfReactions - 1,
                          userReaction: null,
                        ),
                      );
                    }
                  } else if (event.reactionToType ==
                      ThematicGroupReactionToType.replyToComment) {
                    final updatedReplies = item.replies.map((reply) {
                      if (reply.reply.id == reactionToId) {
                        return reply.copyWith(
                          reply: reply.reply.copyWith(
                            numberOfReactions:
                                reply.reply.numberOfReactions - 1,
                            userReaction: null,
                          ),
                        );
                      }
                      return reply;
                    }).toList();
                    return item.copyWith(replies: updatedReplies);
                  }
                  return item;
                }).toList() ??
                [],
          ),
        ));
        return;
      } else {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        final result = await updateReaction(
          currentReaction: currentReaction,
          newReactionType: event.newReactionType,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(NullValue()),
          commentsUiState: UiStateSuccess(
            state.commentsUiState.dataOrNull?.map((item) {
                  if (event.reactionToType ==
                      ThematicGroupReactionToType.comment) {
                    if (item.comment.id == reactionToId) {
                      return item.copyWith(
                        comment: item.comment.copyWith(
                          userReaction: result,
                        ),
                      );
                    }
                  } else if (event.reactionToType ==
                      ThematicGroupReactionToType.replyToComment) {
                    final updatedReplies = item.replies.map((reply) {
                      if (reply.reply.id == reactionToId) {
                        return reply.copyWith(
                          reply: reply.reply.copyWith(
                            userReaction: result,
                          ),
                        );
                      }
                      return reply;
                    }).toList();
                    return item.copyWith(replies: updatedReplies);
                  }
                  return item;
                }).toList() ??
                [],
          ),
        ));

      }
    } catch (e, s) {
      logger.e('Error updating comment reaction', e, s);
      emit(state.copyWith(
        reactionSubmissionUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<Reaction> createReaction({
    required ReactionType reactionType,
    required String reactionToId,
    required ThematicGroupReactionToType reactionToType,
  }) async {
    final result = await _createGroupPostReactionUseCase(
      groupId: state.groupId,
      reactionToId: reactionToId,
      reaction: reactionType,
      reactionToType: reactionToType,
    );
    return result;
  }

  Future<Reaction> updateReaction({
    required Reaction currentReaction,
    required ReactionType newReactionType,
  }) async {
    final result = await _updateGroupPostReactionUseCase(
      reactionId: currentReaction.id,
      reaction: newReactionType,
    );
    return result;
  }

  Future<void> deleteReaction({
    required Reaction currentReaction,
  }) async {
    await _deleteGroupPostReactionUseCase(
      reactionId: currentReaction.id,
    );
  }
}
