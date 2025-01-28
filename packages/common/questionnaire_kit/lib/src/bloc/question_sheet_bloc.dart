import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

part 'question_sheet_event.dart';

part 'question_sheet_state.dart';

class QuestionSheetBloc extends Bloc<QuestionSheetEvent, QuestionSheetState> {
  QuestionSheetBloc({
    SaveAssessmentAnswerUseCase? saveAssessmentAnswerUseCase,
    required List<QuestionData> questions,
  })  : _saveAssessmentAnswerUseCase = saveAssessmentAnswerUseCase ?? getIt(),
        super(QuestionSheetState.create(
          questions: questions,
        )) {
    on<QuestionSheetQuestionsChanged>(_handleQuestionsChanged);
    on<QuestionSheetEvaluated>(_handleEvaluated);
    on<QuestionSheetValidated>(_handleValidated);
    on<QuestionSheetReset>(_handleReset);
    on<QuestionSheetAnswerChanged>(_handleAnswerChanged);
    on<QuestionSheetSubmitted>(_handleSubmitted);
  }

  final SaveAssessmentAnswerUseCase _saveAssessmentAnswerUseCase;

  Future<void> _handleEvaluated(
    QuestionSheetEvaluated event,
    Emitter<QuestionSheetState> emit,
  ) async {
    emit(state.copyWith(evaluationResult: () => null));

    final results = <EvaluationQuestionResult>[];
    for (final question in state.questions) {
      final answer = state.answersByQuestionId[question.id];
      if (answer == null) {
        results
            .add(EvaluationQuestionResultUnanswered(questionId: question.id));
      } else {
        // NOTE: Although the code inside each branch looks the same, we need separate
        // type checks due to Dart's strict type system. Without these explicit type
        // checks, Dart throws a runtime error like "'(String) => bool' is not a subtype
        // of type '((dynamic) => bool)?". This happens because Dart can't infer the correct
        // type for the method calls on different answer types. By explicitly checking
        // the type, we ensure that the evaluation is handled safely and correctly.
        switch (answer) {
          case UserTextAnswer():
            final questionResult = question.evaluate(answer);
            results.add(questionResult);
            break;
          case UserOptionAnswer():
            final questionResult = question.evaluate(answer);
            results.add(questionResult);
            break;
          case UserOptionListAnswer():
            final questionResult = question.evaluate(answer);
            results.add(questionResult);
            break;
          case UserOptionMapAnswer():
            final questionResult = question.evaluate(answer);
            results.add(questionResult);
            break;
          case UserOptionsByIndexAnswer():
            final questionResult = question.evaluate(answer);
            results.add(questionResult);
            break;
        }
      }
    }
    final result = EvaluationResult(
      isCorrect: results.every((result) => result.isCorrect),
      questionResults: results,
    );

    emit(state.copyWith(evaluationResult: () => result));
  }

  Future<void> _handleValidated(
      QuestionSheetValidated event,
      Emitter<QuestionSheetState> emit,
      ) async {
    emit(state.copyWith(evaluationResult: () => null));

    final results = <EvaluationQuestionResult>[];
    for (final question in state.questions) {
      final answer = state.answersByQuestionId[question.id];
      if (answer == null) {
        results
            .add(EvaluationQuestionResultUnanswered(questionId: question.id));
      }
    }
    final result = EvaluationResult(
      isCorrect: results.every((result) => result.isCorrect),
      questionResults: results,
    );

    emit(state.copyWith(evaluationResult: () => result));
  }

  Future<void> _handleAnswerChanged(
    QuestionSheetAnswerChanged event,
    Emitter<QuestionSheetState> emit,
  ) async {
    final updatedAnswers =
        Map<String, UserAnswer>.from(state.answersByQuestionId);
    updatedAnswers[event.questionId] = event.answer;
    emit(
      state.copyWith(answersByQuestionId: UnmodifiableMapView(updatedAnswers)),
    );
  }

  Future<void> _handleSubmitted(
    QuestionSheetSubmitted event,
    Emitter<QuestionSheetState> emit,
  ) async {}

  Future<void> _handleReset(
    QuestionSheetReset event,
    Emitter<QuestionSheetState> emit,
  ) async {
    emit(QuestionSheetState.create(
      questions: state.questions,
    ));
  }

  Future<void> _handleQuestionsChanged(
    QuestionSheetQuestionsChanged event,
    Emitter<QuestionSheetState> emit,
  ) async {
    emit(QuestionSheetState.create(
      questions: event.questions,
    ));
  }
}
