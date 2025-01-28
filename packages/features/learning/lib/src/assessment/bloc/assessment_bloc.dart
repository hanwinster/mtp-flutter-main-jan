import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

part 'assessment_event.dart';

part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc({
    required String courseId,
    required String assessmentId,
    required String materialKey,
    required bool isOfflineMode,
    ObserveCourseAssessmentUseCase? observeAssessmentUseCase,
    ObserveCourseAssessmentsUseCase? observeAssessmentQuestionsUseCase,
    SaveAssessmentAnswerUseCase? saveAssessmentAnswerUseCase,
    SubmitCourseAssessmentUseCase? submitAssessmentUseCase,
  })  : _observeAssessmentQuestionUseCase = observeAssessmentUseCase ?? getIt(),
        _observeAssessmentQuestionsUseCase = observeAssessmentQuestionsUseCase ?? getIt(),
        _saveAssessmentAnswerUseCase = saveAssessmentAnswerUseCase ?? getIt(),
        _submitCourseAssessmentUseCase = submitAssessmentUseCase ?? getIt(),
        super(AssessmentState.create(
          courseId: courseId,
          materialKey: materialKey,
          assessmentQuestionId: assessmentId,
          isOfflineMode: isOfflineMode,
        )) {
    on<AssessmentQuestionFetched>(
      _handleAssessmentQuestionFetched,
      transformer: restartable(),
    );
    on<AssessmentQuestionsFetched>(
      _handleAssessmentQuestionsFetched,
      transformer: restartable(),
    );
    on<AssessmentLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
    on<AssessmentSaved>(_handleSaved);
    on<AssessmentSubmitted>(_handleSubmitted);
    on<AssessmentCorrectAnswersShown>(_handleCorrectAnswersShown);
  }

  final ObserveCourseAssessmentUseCase _observeAssessmentQuestionUseCase;
  final ObserveCourseAssessmentsUseCase _observeAssessmentQuestionsUseCase;
  final SaveAssessmentAnswerUseCase _saveAssessmentAnswerUseCase;
  final SubmitCourseAssessmentUseCase _submitCourseAssessmentUseCase;

  FutureOr<void> _handleAssessmentQuestionFetched(
    AssessmentQuestionFetched event,
    Emitter<AssessmentState> emit,
  ) async {
    emit(
      state.copyWith(
        questionUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeAssessmentQuestionUseCase(ObserveCourseAssessmentUseCaseRequest(
        courseId: state.courseId,
        assessmentId: state.assessmentQuestionId,
      )),
      onData: (result) => state.copyWith(
        questionUiState: UiState.fromResult(result),
      ),
      onError: (e, s) {
        logger.e('Error fetching assessment', e, s);
        return state.copyWith(
          questionUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  FutureOr<void> _handleAssessmentQuestionsFetched(
      AssessmentQuestionsFetched event,
      Emitter<AssessmentState> emit,
      ) async {
    emit(
      state.copyWith(
        questionsUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeAssessmentQuestionsUseCase(ObserveCourseAssessmentsUseCaseRequest(
        courseId: state.courseId,
      )),
      onData: (result) => state.copyWith(
        questionsUiState: UiState.fromResult(result),
      ),
      onError: (e, s) {
        logger.e('Error fetching assessment', e, s);
        return state.copyWith(
          questionsUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _handleLearnerChanged(
    AssessmentLearnerChanged event,
    Emitter<AssessmentState> emit,
  ) async {
    bool isLastQuestion = false;
    final learner = event.learnerUiState.dataOrNull;
    if (learner != null) {
      final hasNextMaterial = learner.hasNextMaterial(state.materialKey);
      isLastQuestion = !hasNextMaterial;
    }
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
        isLastQuestion: isLastQuestion,
      ),
    );
  }

  Future<void> _handleSaved(
    AssessmentSaved event,
    Emitter<AssessmentState> emit,
  ) async {
    final question = state.questionUiState.dataOrNull;
    final answersByQuestionId = event.answersByQuestionId;
    if (answersByQuestionId.isEmpty || question == null) {
      return;
    }

    final type = question.type;
    final answer = answersByQuestionId[question.id];
    AssessmentAnswer? assessmentAnswer;

    switch (type) {
      case AssessmentQuestionType.trueFalse:
        if (answer is UserOptionAnswer) {
          assessmentAnswer = AssessmentStringListAnswer(
            answers: [parseTextFromHtml(answer.option.id)],
          );
        }
      case AssessmentQuestionType.multipleChoice:
        if (answer is UserOptionListAnswer) {
          assessmentAnswer = AssessmentStringListAnswer(
            answers: answer.options.map((e) => parseTextFromHtml(e.id)).toList(),
          );
        }
        break;
      case AssessmentQuestionType.rearrange:
        if (answer is UserOptionListAnswer) {
          assessmentAnswer = AssessmentStringListAnswer(
            answers: answer.options.map((e) => parseTextFromHtml(e.id)).toList(),
          );
        }
        break;
      case AssessmentQuestionType.matching:
        if (answer is UserOptionMapAnswer) {
          //TODO: Confirm why the existing db
          // used list instead of map
          assessmentAnswer = AssessmentStringListAnswer(
            answers: answer.optionsByPrompt.values.map((e) => parseTextFromHtml(e.id)).toList(),
          );
        }
        break;
      case AssessmentQuestionType.longAnswer:
        if (answer is UserTextAnswer) {
          assessmentAnswer = AssessmentStringAnswer(
            answer: answer.text,
          );
        }
        break;
      default:
        throw Exception('Unknown assessment type: $type');
    }

    if (assessmentAnswer == null) {
      return;
    }

    await saveAssessmentAnswer(emit, assessmentAnswer);
  }

  Future<void> saveAssessmentAnswer(
    Emitter<AssessmentState> emit,
    AssessmentAnswer assessmentAnswer,
  ) async {
    emit(
      state.copyWith(
        saveAssessmentUiState: const UiStateInProgress(),
      ),
    );
    try {
      await _saveAssessmentAnswerUseCase(
        SaveAssessmentAnswerUseCaseRequest(
          courseId: state.courseId,
          questionId: state.assessmentQuestionId,
          answer: assessmentAnswer,
        ),
      );
      emit(
        state.copyWith(
          saveAssessmentUiState: const UiStateSuccess(NullValue()),
          isSubmittable: true,
        ),
      );
    } catch (e, s) {
      logger.e('Error saving assessment answer', e, s);
      emit(
        state.copyWith(
          saveAssessmentUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleSubmitted(
    AssessmentSubmitted event,
    Emitter<AssessmentState> emit,
  ) async {
    emit(
      state.copyWith(
        assessmentSubmissionUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _submitCourseAssessmentUseCase(
        SubmitCourseAssessmentUseCaseRequest(
          courseId: state.courseId,
        ),
      );
      emit(
        state.copyWith(
          assessmentSubmissionUiState: UiStateSuccess(result),
        ),
      );
      if (!result.isPass) {
        add(const AssessmentQuestionsFetched());
      }
    } catch (e, s) {
      logger.e('Failed to submit assessment', e, s);
      emit(
        state.copyWith(
          assessmentSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleCorrectAnswersShown(
    AssessmentCorrectAnswersShown event,
    Emitter<AssessmentState> emit,
  ) async {
    emit(
      state.copyWith(
        showCorrectAnswers: true,
      ),
    );
  }
}
