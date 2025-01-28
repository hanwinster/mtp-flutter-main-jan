import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:blog/src/postdetails/models/models.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/models/models.dart';

part 'post_details_event.dart';

part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  PostDetailsBloc({
    required String postId,
    ObserveBlogPostByIdUseCase? observeBlogPostByIdUseCase,
    ObserveBlogPostCategoriesUseCase? observeBlogPostCategoriesUseCase,
    ObserveRecommendedBlogPostsUseCase? observeRecommendedBlogPostsUseCase,
    ObserveBlogPostsByCategoryUseCase? observeBlogPostsByCategoryUseCase,
    ObserveBlogPostCommentsUseCase? observeBlogPostCommentsUseCase,
    CreateBlogPostReactionUseCase? createBlogPostReactionUseCase,
    UpdateBlogPostReactionUseCase? updateBlogPostReactionUseCase,
    DeleteBlogPostReactionUseCase? deleteBlogPostReactionUseCase,
    CreateBlogPostCommentReactionUseCase? createBlogPostCommentReactionUseCase,
    UpdateBlogPostCommentReactionUseCase? updateBlogPostCommentReactionUseCase,
    DeleteBlogPostCommentReactionUseCase? deleteBlogPostCommentReactionUseCase,
    MarkBlogPostAsReadUseCase? markBlogPostAsReadUseCase,
    DeleteBlogPostCommentUseCase? deleteBlogPostCommentUseCase,
    GetCurrentUserIdUseCase? getCurrentUserIdUseCase,
    AnalyticsService? analyticsService,
  })  : _observeBlogPostByIdUseCase = observeBlogPostByIdUseCase ?? getIt(),
        _observeBlogPostCategoriesUseCase =
            observeBlogPostCategoriesUseCase ?? getIt(),
        _observeRecommendedBlogPostsUseCase =
            observeRecommendedBlogPostsUseCase ?? getIt(),
        _observeBlogPostsByCategoryUseCase =
            observeBlogPostsByCategoryUseCase ?? getIt(),
        _observeBlogPostCommentsUseCase =
            observeBlogPostCommentsUseCase ?? getIt(),
        _createBlogPostReactionUseCase =
            createBlogPostReactionUseCase ?? getIt(),
        _updateBlogPostReactionUseCase =
            updateBlogPostReactionUseCase ?? getIt(),
        _deleteBlogPostReactionUseCase =
            deleteBlogPostReactionUseCase ?? getIt(),
        _createBlogPostCommentReactionUseCase =
            createBlogPostCommentReactionUseCase ?? getIt(),
        _updateBlogPostCommentReactionUseCase =
            updateBlogPostCommentReactionUseCase ?? getIt(),
        _deleteBlogPostCommentReactionUseCase =
            deleteBlogPostCommentReactionUseCase ?? getIt(),
        _markBlogPostAsReadUseCase = markBlogPostAsReadUseCase ?? getIt(),
        _deleteBlogPostCommentUseCase = deleteBlogPostCommentUseCase ?? getIt(),
        _getCurrentUserIdUseCase = getCurrentUserIdUseCase ?? getIt(),
        _analyticsService = analyticsService ?? getIt(),
        super(PostDetailsState.create(postId: postId)) {
    on<PostDetailsFetched>(
      _handlePostDetailsFetched,
      transformer: restartable(),
    );
    on<PostDetailsPostReactionChanged>(_handlePostReactionChanged);
    on<PostDetailsCommentReactionChanged>(_handleCommentReactionChanged);
    on<PostDetailsFilteredPostsFetched>(_handleFilteredPostFetched,
        transformer: restartable());
    on<PostDetailsCategoriesFetched>(_handleCategoriesFetched,
        transformer: restartable());
    on<PostDetailsCategoryToggled>(_handleCategoryToggled);
    on<PostDetailsRecommendedPostsFetched>(_handleRecommendedPostsFetched,
        transformer: restartable());
    on<PostDetailsCommentsFetched>(_handleCommentsFetched,
        transformer: restartable());
    on<PostDetailsMarkAsReadRequested>(_handleMarkAsReadRequested);
    on<PostDetailsCommentDeleted>(_handleCommentDeleted);
    on<PostDetailsPostShareTracked>(_handlePostShareTracked);

    _analyticsService.trackBlogPostView(postId: postId);
  }

  final ObserveBlogPostByIdUseCase _observeBlogPostByIdUseCase;
  final ObserveRecommendedBlogPostsUseCase _observeRecommendedBlogPostsUseCase;
  final ObserveBlogPostsByCategoryUseCase _observeBlogPostsByCategoryUseCase;
  final ObserveBlogPostCategoriesUseCase _observeBlogPostCategoriesUseCase;
  final ObserveBlogPostCommentsUseCase _observeBlogPostCommentsUseCase;

  final CreateBlogPostReactionUseCase _createBlogPostReactionUseCase;
  final UpdateBlogPostReactionUseCase _updateBlogPostReactionUseCase;
  final DeleteBlogPostReactionUseCase _deleteBlogPostReactionUseCase;

  final DeleteBlogPostCommentUseCase _deleteBlogPostCommentUseCase;

  final CreateBlogPostCommentReactionUseCase
      _createBlogPostCommentReactionUseCase;
  final UpdateBlogPostCommentReactionUseCase
      _updateBlogPostCommentReactionUseCase;
  final DeleteBlogPostCommentReactionUseCase
      _deleteBlogPostCommentReactionUseCase;

  final MarkBlogPostAsReadUseCase _markBlogPostAsReadUseCase;

  final GetCurrentUserIdUseCase _getCurrentUserIdUseCase;

  final AnalyticsService _analyticsService;

  FutureOr<void> _handlePostDetailsFetched(
    PostDetailsFetched event,
    Emitter<PostDetailsState> emit,
  ) async {
    await emit.forEach(
      _observeBlogPostByIdUseCase(
        ObserveBlogPostByIdRequest(postId: state.postId),
      ),
      onData: (posts) {
        return state.copyWith(
          postUiState: UiState.fromResult(posts),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          postUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handlePostReactionChanged(
    PostDetailsPostReactionChanged event,
    Emitter<PostDetailsState> emit,
  ) async {
    try {
      final currentReaction = state.postUiState.dataOrNull?.currentReaction;
      if (currentReaction == null) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        await createPostReaction(
          newReactionType: event.newReaction,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(''),
        ));
        return;
      }

      if (event.oldReaction == event.newReaction) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        await deletePostReaction(currentReaction: currentReaction);
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(''),
        ));
        return;
      }

      emit(state.copyWith(
        reactionSubmissionUiState: const UiStateInProgress(),
      ));
      await updatePostReaction(
        currentReaction: currentReaction,
        newReactionType: event.newReaction,
      );
      emit(state.copyWith(
        reactionSubmissionUiState: const UiStateSuccess(''),
      ));
    } catch (e, s) {
      logger.e('Error updating post reaction', e, s);
      emit(state.copyWith(
        reactionSubmissionUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> createPostReaction({
    required ReactionType newReactionType,
  }) async {
    await _createBlogPostReactionUseCase(
      CreateBlogPostReactionRequest(
        postId: state.postId,
        reactionType: newReactionType,
      ),
    );
  }

  Future<void> updatePostReaction({
    required Reaction currentReaction,
    required ReactionType newReactionType,
  }) async {
    await _updateBlogPostReactionUseCase(
      UpdateBlogPostReactionRequest(
        postId: state.postId,
        reactionId: currentReaction.id,
        reactionType: newReactionType,
      ),
    );
  }

  Future<void> deletePostReaction({
    required Reaction currentReaction,
  }) async {
    await _deleteBlogPostReactionUseCase(
      DeleteBlogPostReactionRequest(
        postId: state.postId,
        reactionId: currentReaction.id,
      ),
    );
  }

  FutureOr<void> _handleCommentReactionChanged(
    PostDetailsCommentReactionChanged event,
    Emitter<PostDetailsState> emit,
  ) async {
    try {
      final currentReaction = event.currentReaction;
      final commentId = event.commentId;
      if (currentReaction == null) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        await createCommentReaction(
          commentId: commentId,
          reactionType: event.newReactionType,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(''),
        ));
        return;
      }

      final oldReaction = currentReaction.reactionType;
      if (oldReaction == event.newReactionType) {
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateInProgress(),
        ));
        await deleteCommentReaction(
          commentId: commentId,
          reaction: currentReaction,
        );
        emit(state.copyWith(
          reactionSubmissionUiState: const UiStateSuccess(''),
        ));
        return;
      }

      emit(state.copyWith(
        reactionSubmissionUiState: const UiStateInProgress(),
      ));
      await updateCommentReaction(
        commentId: commentId,
        currentReaction: currentReaction,
        newReactionType: event.newReactionType,
      );
      emit(state.copyWith(
        reactionSubmissionUiState: const UiStateSuccess(''),
      ));
    } catch (e, s) {
      logger.e('Error updating comment reaction', e, s);
      emit(state.copyWith(
        reactionSubmissionUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> createCommentReaction({
    required String commentId,
    required ReactionType reactionType,
  }) async {
    await _createBlogPostCommentReactionUseCase(
      CreateBlogPostCommentReactionRequest(
        commentId: commentId,
        reaction: reactionType,
      ),
    );
  }

  Future<void> updateCommentReaction({
    required String commentId,
    required Reaction currentReaction,
    required ReactionType newReactionType,
  }) async {
    await _updateBlogPostCommentReactionUseCase(
      UpdateBlogPostCommentReactionRequest(
        commentId: commentId,
        reactionId: currentReaction.id,
        reactionType: newReactionType,
      ),
    );
  }

  Future<void> deleteCommentReaction({
    required String commentId,
    required Reaction reaction,
  }) async {
    await _deleteBlogPostCommentReactionUseCase(
      DeleteBlogPostCommentReactionRequest(
        commentId: commentId,
        reactionId: reaction.id,
      ),
    );
  }

  FutureOr<void> _handleFilteredPostFetched(
    PostDetailsFilteredPostsFetched event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(
      filteredPostsUiState: const UiStateInProgress(),
    ));

    final category = event.category;

    await emit.forEach(
      category == null
          ? _observeRecommendedBlogPostsUseCase()
          : _observeBlogPostsByCategoryUseCase(
              ObserveBlogPostsByCategoryRequest(
                categoryId: category.id,
                keyword: '',
              ),
            ),
      onData: (posts) {
        return state.copyWith(
          filteredPostsUiState: UiState.fromResult(posts),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          filteredPostsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleCategoriesFetched(
    PostDetailsCategoriesFetched event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(
      categoriesUiState: const UiStateInProgress(),
    ));

    await emit.forEach(
      _observeBlogPostCategoriesUseCase(),
      onData: (categories) {
        return state.copyWith(
          categoriesUiState: UiState.fromResultTransform(
            categories,
            (categories) {
              return categories.map((category) {
                return SelectableCategoryItemState(
                  category: category,
                  isSelected: state.selectedCategory?.id == category.id,
                );
              }).toList();
            },
          ),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          categoriesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleCategoryToggled(
    PostDetailsCategoryToggled event,
    Emitter<PostDetailsState> emit,
  ) async {
    final updatedSelectedItem =
        event.item.isSelected ? null : event.item.category;

    emit(
      state.copyWith(
        selectedCategory: () => updatedSelectedItem,
        categoriesUiState: state.categoriesUiState.map((items) {
          return items.map((item) {
            return item.copyWith(
                isSelected: item.category.id == updatedSelectedItem?.id);
          }).toList();
        }),
      ),
    );

    add(PostDetailsFilteredPostsFetched(updatedSelectedItem));
  }

  FutureOr<void> _handleRecommendedPostsFetched(
    PostDetailsRecommendedPostsFetched event,
    Emitter<PostDetailsState> emit,
  ) async {
    add(const PostDetailsFilteredPostsFetched(null));
  }

  FutureOr<void> _handleCommentsFetched(
    PostDetailsCommentsFetched event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(
      commentsUiState: const UiStateInProgress(),
    ));

    final currentUserId = await _getCurrentUserIdUseCase();
    await emit.forEach(
      _observeBlogPostCommentsUseCase(
        ObserveBlogPostCommentsRequest(postId: state.postId),
      ),
      onData: (result) {
        return state.copyWith(
            commentsUiState: UiState.fromResultTransform(
          result,
          (comments) {
            return comments.map((comment) {
              return UiPostCommentItem(
                comment: comment,
                isOwner: _isCommentOwner(comment.user, currentUserId),
              );
            }).toList();
          },
        ));
      },
      onError: (e, s) {
        return state.copyWith(
          commentsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _handleMarkAsReadRequested(
    PostDetailsMarkAsReadRequested event,
    Emitter<PostDetailsState> emit,
  ) async {
    emit(state.copyWith(
      markAsReadSubmissionUiState: const UiStateInProgress(),
    ));
    try {
      await _markBlogPostAsReadUseCase(
          MarkBlogPostAsReadUseCaseRequest(postId: state.postId));
      emit(state.copyWith(
        markAsReadSubmissionUiState: const UiStateSuccess(''),
      ));
    } catch (e, s) {
      logger.e('Error marking post as read', e, s);
      emit(state.copyWith(
        markAsReadSubmissionUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> _handleCommentDeleted(
    PostDetailsCommentDeleted event,
    Emitter<PostDetailsState> emit,
  ) async {
    try {
      await _deleteBlogPostCommentUseCase(
        DeleteBlogPostCommentRequest(
          postId: state.postId,
          commentId: event.commentId,
        ),
      );
    } catch (e, s) {
      logger.e('Error deleting comment', e, s);
    }
  }

  bool _isCommentOwner(User? commentOwner, String currentUserId) {
    if (commentOwner == null || currentUserId.isEmpty) {
      return false;
    }
    return commentOwner.id == currentUserId;
  }

  Future<void> _handlePostShareTracked(
    PostDetailsPostShareTracked event,
    Emitter<PostDetailsState> emit,
  ) async {
    try {
      await _analyticsService.trackBlogPostShare(postId: state.postId);
    } catch (e, s) {
      logger.e('Error tracking post share', e, s);
    }
  }
}
