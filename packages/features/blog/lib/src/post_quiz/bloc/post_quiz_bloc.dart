import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'post_quiz_event.dart';

part 'post_quiz_state.dart';

class PostQuizBloc extends Bloc<PostQuizEvent, PostQuizState> {
  PostQuizBloc({
    required String postId,
    GetBlogPostQuizQuestionsUseCase? getBlogPostQuizQuestionsUseCase,
    SubmitBlogPostQuizAnswersUseCase? submitBlogPostQuizAnswersUseCase,
  })  : _getBlogPostQuizQuestionsUseCase =
            getBlogPostQuizQuestionsUseCase ?? getIt(),
        _submitBlogPostQuizAnswersUseCase =
            submitBlogPostQuizAnswersUseCase ?? getIt(),
        super(PostQuizState.create(postId: postId)) {
    on<PostQuizQuestionsFetched>(
      _handleQuestionsFetched,
      transformer: restartable(),
    );
    on<PostQuizPageIndexChanged>(_handlePageIndexChanged);
    on<PostQuizUserAnsweredSubmitted>(_handleUserAnsweredSubmitted);
  }

  final GetBlogPostQuizQuestionsUseCase _getBlogPostQuizQuestionsUseCase;
  final SubmitBlogPostQuizAnswersUseCase _submitBlogPostQuizAnswersUseCase;

  FutureOr<void> _handleQuestionsFetched(
    PostQuizQuestionsFetched event,
    Emitter<PostQuizState> emit,
  ) async {
    emit(
      state.copyWith(
        questionsUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _getBlogPostQuizQuestionsUseCase(
        GetBlogPostQuizQuestionsUseCaseRequest(
          postId: state.postId,
        ),
      );

      if (result.isEmpty) {
        emit(
          state.copyWith(
            questionsUiState: const UiStateEmpty(),
            overallScore: 0,
          ),
        );
      } else {
        emit(
          state.copyWith(
            questionsUiState: UiStateSuccess(result),
            overallScore: result.firstOrNull?.userAnswer?.overallScore,
          ),
        );
      }
    } catch (e, s) {
      emit(
        state.copyWith(questionsUiState: UiStateFailure.fromError(e, s)),
      );
    }
  }

  Future<void> _handlePageIndexChanged(
    PostQuizPageIndexChanged event,
    Emitter<PostQuizState> emit,
  ) async {
    emit(
      state.copyWith(
        currentPageIndex: event.index,
      ),
    );
  }

  Future<void> _handleUserAnsweredSubmitted(
    PostQuizUserAnsweredSubmitted event,
    Emitter<PostQuizState> emit,
  ) async {
    emit(
      state.copyWith(
        userAnswersSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _submitBlogPostQuizAnswersUseCase(
        SubmitBlogPostQuizAnswersUseCaseRequest(
          postId: state.postId,
        ),
      );

      logger.d('Result: $result');
      emit(
        state.copyWith(
          userAnswersSubmissionUiState: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to submit answers', e, s);
      emit(
        state.copyWith(
          userAnswersSubmissionUiState: UiStateFailure.fromError(e, s),
        ),
      );
    }
  }
}
