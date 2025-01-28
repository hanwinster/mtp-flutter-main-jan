import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:blog/blog.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'post_list_event.dart';

part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc({
    required PostListFilter filter,
    ObserveBlogPostsByTagUseCase? observeBlogPostsByTagUseCase,
  })  : _observeBlogPostsByTagUseCase = observeBlogPostsByTagUseCase ?? getIt(),
        super(PostListState.create(filter: filter)) {
    on<PostListPostsFetched>(
      _handlePostsFetched,
      transformer: restartable(),
    );
  }

  final ObserveBlogPostsByTagUseCase _observeBlogPostsByTagUseCase;

  FutureOr<void> _handlePostsFetched(
    PostListPostsFetched event,
    Emitter<PostListState> emit,
  ) async {
    emit(state.copyWith(postsUiState: const UiStateInProgress()));

    if (state.filter is PostListFilterByTag) {
      final filter = state.filter as PostListFilterByTag;
      await emit.forEach(
        _observeBlogPostsByTagUseCase(
          ObserveBlogPostsByTagRequest(tagId: filter.tagId),
        ),
        onData: (posts) {
          return state.copyWith(
            postsUiState: UiState.fromResult(posts),
          );
        },
        onError: (e, s) {
          return state.copyWith(
            postsUiState: UiStateFailure.fromError(e),
          );
        },
      );
    }
  }
}
