import 'dart:async';
import 'dart:io';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({
    required String courseId,
    required String quizId,
    required String materialKey,
    required bool isOfflineMode,
    ObserveLearningQuizUseCase? observeQuizUseCase,
    SaveQuizAnswerUseCase? saveQuizAnswerUseCase,
    SubmitQuizAssignmentUseCase? submitQuizAssignmentUseCase,
  })  : _observeQuizUseCase = observeQuizUseCase ?? getIt(),
        _saveQuizAnswerUseCase = saveQuizAnswerUseCase ?? getIt(),
        _submitQuizAssignmentUseCase = submitQuizAssignmentUseCase ?? getIt(),
        super(QuizState.create(
          courseId: courseId,
          quizId: quizId,
          materialKey: materialKey,
          isOfflineMode: isOfflineMode,
        )) {
    on<QuizFetched>(
      _handleQuizFetched,
      transformer: restartable(),
    );
    on<QuizAnswered>(_handleQuizAnswered);
    on<QuizLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
    on<QuizAnswerSubmitted>(_handleAnswerSubmitted);
    on<QuizAssignmentSubmitted>(_handleAssignmentSubmitted);
  }

  final ObserveLearningQuizUseCase _observeQuizUseCase;
  final SaveQuizAnswerUseCase _saveQuizAnswerUseCase;
  final SubmitQuizAssignmentUseCase _submitQuizAssignmentUseCase;

  FutureOr<void> _handleQuizFetched(
    QuizFetched event,
    Emitter<QuizState> emit,
  ) async {
    emit(
      state.copyWith(
        quizUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeQuizUseCase(ObserveLearningQuizUseCaseRequest(
        courseId: state.courseId,
        quizId: state.quizId,
      )),
      onData: (result) {
        return state.copyWith(
          quizUiState: UiState.fromResult(result),
        );
      },
      onError: (e, s) {
        logger.e('Error fetching quiz:', e, s);
        return state.copyWith(
          quizUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _handleLearnerChanged(
    QuizLearnerChanged event,
    Emitter<QuizState> emit,
  ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }

  Future<void> _handleQuizAnswered(
    QuizAnswered event,
    Emitter<QuizState> emit,
  ) async {
    emit(
      state.copyWith(
        hasAnswered: event.hasAnswered,
      ),
    );
  }

  Future<void> _handleAnswerSubmitted(
    QuizAnswerSubmitted event,
    Emitter<QuizState> emit,
  ) async {
    try {
      final quiz = state.quizUiState.dataOrNull;
      if (quiz == null) {
        return;
      }

      final questions = state.quizUiState.dataOrNull?.questions ?? [];
      if (questions.isEmpty) {
        return;
      }

      emit(
        state.copyWith(
          answerSubmissionUiState: const UiStateInProgress(),
        ),
      );

      if (state.isOfflineMode) {
        emit(
          state.copyWith(
            answerSubmissionUiState: const UiStateSuccess(''),
            hasAnswered: true,
          ),
        );
        return;
      }

      await _saveQuizAnswerUseCase(
        SaveQuizAnswerUseCaseRequest(
          courseId: state.courseId,
          quizId: state.quizId,
          answersById: event.answersByQuestionId,
          quizType: quiz.type,
        ),
      );
      emit(
        state.copyWith(
          answerSubmissionUiState: const UiStateSuccess(''),
          hasAnswered: true,
        ),
      );
    } catch (e, s) {
      logger.e('Error submitting quiz answer:', e, s);
      emit(
        state.copyWith(
          answerSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleAssignmentSubmitted(
    QuizAssignmentSubmitted event,
    Emitter<QuizState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          answerSubmissionUiState: const UiStateInProgress(),
        ),
      );

      if (state.isOfflineMode) {
        emit(
          state.copyWith(
            answerSubmissionUiState: const UiStateSuccess(''),
            hasAnswered: true,
          ),
        );
        return;
      }

      final message = await _submitQuizAssignmentUseCase(
        SubmitQuizAssignmentUseCaseRequest(
          courseId: state.courseId,
          quizId: state.quizId,
          assignmentId: event.assignmentId,
          currentSection: state.materialKey,
          direction: CourseNavigationDirection.next,
          file: event.file,
        ),
      );
      emit(
        state.copyWith(
          answerSubmissionUiState: UiStateSuccess(message),
          hasAnswered: true,
        ),
      );
    } catch (e, s) {
      logger.e('Error submitting quiz assignment:', e, s);
      emit(
        state.copyWith(
          answerSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
