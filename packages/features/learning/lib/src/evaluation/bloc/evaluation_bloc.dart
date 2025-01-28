import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

part 'evaluation_event.dart';

part 'evaluation_state.dart';

class EvaluationBloc extends Bloc<EvaluationEvent, EvaluationState> {
  EvaluationBloc({
    required String courseId,
    ObserveEvaluationQuestionsUseCase? observeEvaluationQuestionsUseCase,
    SaveEvaluationAnswersUseCase? saveEvaluationAnswersUseCase,
  })  : _observeEvaluationQuestionsUseCase =
            observeEvaluationQuestionsUseCase ?? getIt(),
        _saveEvaluationAnswersUseCase = saveEvaluationAnswersUseCase ?? getIt(),
        super(EvaluationState.create(courseId: courseId)) {
    on<EvaluationQuestionsFetched>(
      _handleQuestionsFetched,
      transformer: restartable(),
    );
    on<EvaluationAnswerSubmitted>(
      _handleAnswerSubmitted,
    );
  }

  final ObserveEvaluationQuestionsUseCase _observeEvaluationQuestionsUseCase;
  final SaveEvaluationAnswersUseCase _saveEvaluationAnswersUseCase;

  FutureOr<void> _handleQuestionsFetched(
    EvaluationQuestionsFetched event,
    Emitter<EvaluationState> emit,
  ) async {
    emit(
      state.copyWith(
        evaluationQuestionsUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeEvaluationQuestionsUseCase(
        ObserveEvaluationQuestionsUseCaseRequest(
          courseId: state.courseId,
        ),
      ),
      onData: (result) => state.copyWith(
        evaluationQuestionsUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        evaluationQuestionsUiState: UiStateFailure.fromError(e, s),
      ),
    );
  }

  Future<void> _handleAnswerSubmitted(
    EvaluationAnswerSubmitted event,
    Emitter<EvaluationState> emit,
  ) async {
    emit(
      state.copyWith(
        answerSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final message = await _saveEvaluationAnswersUseCase(
        SaveEvaluationAnswersUseCaseRequest(
          courseId: state.courseId,
          answers: _mapEvaluationAnswers(event.answers),
        ),
      );
      emit(state.copyWith(
        answerSubmissionUiState: UiStateSuccess(message),
      ));
    } catch (e, s) {
      emit(
        state.copyWith(
          answerSubmissionUiState: UiStateFailure.fromError(e, s),
        ),
      );
    }
  }

  List<String> _mapEvaluationAnswers(Map<String, UserAnswer> answersByQuestionId) {
    final answers = <String>[];
    for (final entry in answersByQuestionId.entries) {
      final answer = entry.value;
      if (answer is UserOptionAnswer) {
        answers.add(answer.option.id);
      } else if (answer is UserTextAnswer) {
        answers.add(answer.text);
      } else {
        // Evaluation only supports single option and text answers
        continue;
      }
    }

    return answers;
  }
}
