import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:ui/ui.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final ObserveThematicGroupPostListUseCase
      _observeThematicGroupPostListUseCase;
  final PreferencesDataSource _preferencesDataSource;
  final CreateGroupPostReactionUseCase _createThematicGroupPostReactionUseCase;
  final DeleteGroupPostUseCase _deleteThematicGroupPostUseCase;
  final DeleteGroupPostReactionUseCase _deleteGroupPostReactionUseCase;
  final int _currentPage = 1; // To track the current page

  PostsBloc({
    ObserveThematicGroupPostListUseCase? observeThematicGroupPostListUseCase,
    PreferencesDataSource? preferencesDataSource,
    DeleteGroupPostUseCase? deleteThematicGroupPostUseCase,
    CreateGroupPostReactionUseCase? createThematicGroupPostReactionUseCase,
    DeleteGroupPostReactionUseCase? deleteGroupPostReactionUseCase,
  })  : _observeThematicGroupPostListUseCase =
            observeThematicGroupPostListUseCase ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt(),
        _createThematicGroupPostReactionUseCase =
            createThematicGroupPostReactionUseCase ?? getIt(),
        _deleteThematicGroupPostUseCase =
            deleteThematicGroupPostUseCase ?? getIt(),
        _deleteGroupPostReactionUseCase =
            deleteGroupPostReactionUseCase ?? getIt(),
        super(const PostsState()) {
    // When PostsFetched event is called, trigger loading of posts
    on<PostsFetched>(_onPostsFetched);
    on<PostGPDelete>(_handlePostDelete);
    on<ReactToPost>(_onPostReact);
    on<UnReactToPost>(_deleteReaction);
    // When PostsLoadMore is triggered, load more posts (pagination)
    on<PostsLoadMore>(_onPostsLoadMore);
  }

  Future<void> _handlePostDelete(
    PostGPDelete event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(state.copyWith(postDeleteUiState: const UiStateInitial()));

      final result = await _deleteThematicGroupPostUseCase(
        postId: event.postId,
      );

      if (result is ResultSuccess) {
        // Remove the deleted post from the current state
        final updatedPosts =
            state.posts.where((post) => post.id != event.postId).toList();

        // Reset pagination state
        emit(state.copyWith(
          postDeleteUiState: UiStateSuccess(result.dataOrNull),
          posts: updatedPosts,
          page: 1, // Reset to first page
          hasReachedMax: false, // Reset hasReachedMax
          postsUiState:
              UiStateSuccess(updatedPosts), // Update UI state with new list
        ));
        // Trigger a refresh to get fresh data
        add(PostsFetched(
          groupId: event.groupId,
          pageSize: 15,
        ));
      } else if (result is ResultError) {
        emit(state.copyWith(
            postDeleteUiState: UiStateFailure.fromError(result)));
      }
    } catch (e) {
      emit(state.copyWith(postDeleteUiState: UiStateFailure.fromError(e)));
    }
  }

  FutureOr<void> _onPostReact(
      ReactToPost event, Emitter<PostsState> emit) async {
    try {
      emit(state.copyWith(reactionUiState: const UiStateInitial()));
      final result = await _createThematicGroupPostReactionUseCase(
          groupId: "${event.groupId}",
          reactionToId: "${event.postId}",
          reaction: event.reaction_type,
          reactionToType: ThematicGroupReactionToType.post);

      if (result is ResultSuccess) {
        // Emit success state if the post creation was successful
        emit(state.copyWith(
          reactionUiState: UiStateSuccess(result),
        ));
      } else if (result is ResultError) {
        // Emit failure state if an error occurred
        emit(state.copyWith(
          reactionUiState: UiStateFailure.fromError(result),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        postsUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  FutureOr<void> _deleteReaction(
      UnReactToPost event, Emitter<PostsState> emit) async {
    try {
      await _deleteGroupPostReactionUseCase(
        reactionId: event.postId.toString(),
      );
    } catch (e) {
      emit(state.copyWith(
        postsUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> _onPostsFetched(
    PostsFetched event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(
      postsUiState: const UiStateInitial(),
      userUiState: const UiStateInitial(),
    ));

    User? user = await _preferencesDataSource.getUser();
    UiState<User?> userUiState = user != null
        ? UiStateSuccess(user)
        : UiStateFailure.other("No user logged in");

    await emit.forEach<Result<List<ThematicGroupPost>>>(
      _observeThematicGroupPostListUseCase(
        page: state.page,
        pageSize: event.pageSize,
        group_id: event.groupId,
      ),
      onData: (result) {
        if (result is ResultSuccess<List<ThematicGroupPost>>) {
          // If it's page 1, clear existing posts
          final baseList =
              state.page == 1 ? <ThematicGroupPost>[] : state.posts;

          // Filter out duplicates and inactive posts
          final existingPostIds = baseList.map((post) => post.id).toSet();
          List<ThematicGroupPost> newPosts = result.data
              .where((post) =>
                  post.active == 1 && !existingPostIds.contains(post.id))
              .toList();

          final hasReachedMax = newPosts.length < event.pageSize!;
          final updatedPosts = baseList + newPosts;

          return state.copyWith(
            postsUiState: UiStateSuccess(updatedPosts),
            posts: updatedPosts,
            page: hasReachedMax ? state.page : state.page + 1,
            hasReachedMax: hasReachedMax,
            userUiState: userUiState,
          );
        } else if (result is ResultError) {
          return state.copyWith(postsUiState: UiStateFailure.fromError(result));
        }
        return state;
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          postsUiState: UiStateFailure.fromError(error),
          userUiState: userUiState,
        );
      },
    );
  }

  Future<void> _onPostsLoadMore(
      PostsLoadMore event, Emitter<PostsState> emit) async {
    if (state.hasReachedMax) return; // Prevent loading if max is reached

    await emit.forEach<Result<List<ThematicGroupPost>>>(
        _observeThematicGroupPostListUseCase(
            page: state.page,
            pageSize: event.pageSize,
            group_id: event.groupId), onData: (result) {
      if (result is ResultSuccess<List<ThematicGroupPost>>) {
        final updatedPosts = List<ThematicGroupPost>.from(state.posts)
          ..addAll(result.data);
        return state.copyWith(
          posts: updatedPosts,
          page: state.page + 1, // Increment page for pagination
          hasReachedMax:
              result.data.isEmpty, // Set max reached if no data returned
        );
      } else if (result is ResultError) {
        return state.copyWith(postsUiState: UiStateFailure.fromError(result));
      }
      return state; // If no change, return the same state
    }, onError: (error, stackTrace) {
      return state.copyWith(
          postsUiState: UiStateFailure.fromError(error)); // Handle error
    });
  }
}
