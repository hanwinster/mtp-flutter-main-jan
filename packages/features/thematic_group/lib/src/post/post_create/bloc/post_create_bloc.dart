import 'dart:io';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';
import 'package:ui/ui.dart';

part 'post_create_event.dart';

part 'post_create_state.dart';

class PostCreateBloc extends Bloc<PostCreateEvent, PostCreateState> {
  final CreateGroupPostUseCase _createGroupPostUseCase;
  final PreferencesDataSource _preferencesDataSource;

  PostCreateBloc({
    CreateGroupPostUseCase? createGroupPostUseCase,
    PreferencesDataSource? preferencesDataSource,
  })  : _createGroupPostUseCase = createGroupPostUseCase ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt(),
        super(PostCreateState.create()) {
    on<PostCreateUserFetched>(_handleUserFetched);
    on<PostCreateSubmitted>(_handleSubmitted);
  }

  Future<void> _handleSubmitted(
    PostCreateSubmitted event,
    Emitter<PostCreateState> emit,
  ) async {
    try {
      emit(state.copyWith(postSubmissionUiState: const UiStateInProgress()));

      final result = await _createGroupPostUseCase(
        groupId: event.groupId,
        description: event.description,
        uploadedFile: event.uploadedFile,
        uploadedVideo: event.uploadedVideo,
      );

      emit(
        state.copyWith(
          postSubmissionUiState: const UiStateSuccess(NullValue()),
        ),
      );
    } catch (e, s) {
      logger.e('Error creating post', e, s);
      emit(
        state.copyWith(
          postSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleUserFetched(
    PostCreateUserFetched event,
    Emitter<PostCreateState> emit,
  ) async {
    try {
      User? user = await _preferencesDataSource.getUser();
      emit(
        state.copyWith(
          userUiState:
              user == null ? const UiStateEmpty() : UiStateSuccess(user),
        ),
      );
    } catch (e, s) {
      logger.e('Error fetching user', e, s);
      emit(
        state.copyWith(
          userUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
