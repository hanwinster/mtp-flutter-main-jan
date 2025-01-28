import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:ui/ui.dart';

part 'post_detail_event.dart';

part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({
    required String postId,
    PreferencesDataSource? preferencesDataSource,
    GetGroupPostUseCase? getGroupPostUseCase,
    DeleteGroupPostUseCase? deleteGroupPostUseCase,
    CreateGroupPostReactionUseCase? createGroupPostReactionUseCase,
  })  : _getGroupPostUseCase = getGroupPostUseCase ?? getIt(),
        _createGroupPostReactionUseCase =
            createGroupPostReactionUseCase ?? getIt(),
        _deleteGroupPostUseCase = deleteGroupPostUseCase ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt(),
        super(PostDetailState.create(postId: postId)) {
    on<PostDetailFetched>(_handlePostFetched, transformer: restartable());
    on<ReactToComment>(_onPostReact);
    on<PostDelete>(_handlePostDelete);
  }

  final GetGroupPostUseCase _getGroupPostUseCase;
  final PreferencesDataSource _preferencesDataSource;
  final DeleteGroupPostUseCase _deleteGroupPostUseCase;
  final CreateGroupPostReactionUseCase _createGroupPostReactionUseCase;

  Future<void> _onPostReact(
    ReactToComment event,
    Emitter<PostDetailState> emit,
  ) async {
    // try {
    //   emit(state.copyWith(reactionUiState: const UiStateInitial()));
    //   final result = await _createGroupPostReactionUseCase(
    //       group_id: event.groupId,
    //       reaction_to_id: event.reaction_to_id,
    //       reaction_type: event.reaction_type,
    //       reaction_to_type: event.reaction_to_type);
    //   if (result is ResultSuccess) {
    //     // Emit success state if the post creation was successful
    //     emit(state.copyWith(
    //       reactionUiState: UiStateSuccess(result.dataOrNull!),
    //     ));
    //   } else if (result is ResultError) {
    //     // Emit failure state if an error occurred
    //     emit(state.copyWith(
    //       reactionUiState: UiStateFailure.fromError(result),
    //     ));
    //   }
    // } catch (e) {
    //   emit(state.copyWith(
    //     reactionUiState: UiStateFailure.fromError(e),
    //   ));
    // }
  }

  Future<void> _handlePostDelete(
    PostDelete event,
    Emitter<PostDetailState> emit,
  ) async {
    try {
      // Emit state to indicate submission is in progress
      emit(state.copyWith(postDeleteUiState: const UiStateInitial()));

      // Call the use case to create the post
      final result = await _deleteGroupPostUseCase(
        postId: event.postId,
      );

      // Handle the result based on whether it's a success or an error
      if (result is ResultSuccess) {
        // Emit success state if the post creation was successful
        emit(state.copyWith(
            postDeleteUiState: UiStateSuccess(result.dataOrNull)));
      } else if (result is ResultError) {
        // Emit failure state if an error occurred
        emit(state.copyWith(
            postDeleteUiState: UiStateFailure.fromError(result)));
      }
    } catch (e) {
      // Emit failure state if an exception is thrown
      emit(state.copyWith(postDeleteUiState: UiStateFailure.fromError(e)));
    }
  }

  Future<void> _handlePostFetched(
    PostDetailFetched event,
    Emitter<PostDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(postUiState: const UiStateInProgress()));
      final result = await _getGroupPostUseCase(
        GetGroupPostUseCaseRequest(
          postId: state.postId,
        ),
      );
      emit(state.copyWith(
        postUiState: UiStateSuccess(result),
      ));
    } catch (e, s) {
      logger.e('Error fetching post', e, s);
      emit(state.copyWith(
        postUiState: UiStateFailure.fromError(e),
      ));
    }
  }
}
