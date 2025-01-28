import 'dart:async';
import 'dart:io';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:ui/ui.dart';

part 'post_edit_event.dart';

part 'post_edit_state.dart';

class PostEditBloc extends Bloc<PostEditEvent, PostEditState> {
  final EditGroupPostUseCase _editGroupPostUseCase;
  final PreferencesDataSource _preferencesDataSource;
  final PostUpdateService _postUpdateService = PostUpdateService();
  PostEditBloc({
    required String postId,
    EditGroupPostUseCase? editGroupPostUseCase,
    PreferencesDataSource? preferencesDataSource,
  })  : _editGroupPostUseCase = editGroupPostUseCase ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt(),
        super(PostEditState.create(postId: postId)) {
    on<EditPostEvent>(_handlePostCreation);
    on<FectchUserEvent>(_handleUserFetch);
  }

  Future<void> _handlePostCreation(
    EditPostEvent event,
    Emitter<PostEditState> emit,
  ) async {
    try {
      emit(state.copyWith(postUiState: const UiStateInProgress()));

      await _editGroupPostUseCase(
        post_id: event.post_id,
        group_id: event.group_id,
        description: event.description,
        uploadedFile: event.uploadedFile,
        uploadedVideo: event.uploadedVideo,
      );
      if (state.userUiState.dataOrNull != null) {
        final postData = GroupPendingPostData(
          user: state.userUiState.dataOrNull!,
          createdAt: DateTime.now(),
          imageUrl: event.uploadedFile,
          uploadedVideoUrl: event.uploadedVideo,
          description: event.description,
        );

        // Notify listeners with both postId and postData
        _postUpdateService.notifyPostUpdate(event.post_id, postData);
      }

      emit(state.copyWith(
        formSubmissionUiState: const UiStateSuccess(NullValue()),
      ));
    } catch (e, s) {
      logger.e('Error creating post', e, s);
      emit(state.copyWith(
        postUiState: UiStateFailure.fromError(e),
      ));
    }
  }

  Future<void> _handleUserFetch(
    FectchUserEvent event,
    Emitter<PostEditState> emit,
  ) async {
    // emit(state.copyWith(userUiState: const UiStateInProgress()));

    await emit.forEach(
      _preferencesDataSource.observeUser(),
      onData: (user) {
        if (user != null) {
          return state.copyWith(
            userUiState: UiStateSuccess(user),
          );
        } else {
          return state.copyWith(
            userUiState: UiStateFailure.other("No user logged in"),
          );
        }
      },
    );
  }
}

class PostUpdateService {
  static final PostUpdateService _instance = PostUpdateService._internal();
  factory PostUpdateService() => _instance;
  PostUpdateService._internal();

  final _postUpdateController =
      StreamController<(String, GroupPendingPostData)>.broadcast();
  Stream<(String, GroupPendingPostData)> get postUpdates =>
      _postUpdateController.stream;

  void notifyPostUpdate(String postId, GroupPendingPostData postData) {
    _postUpdateController.add((postId, postData));
  }

  void dispose() {
    _postUpdateController.close();
  }
}
