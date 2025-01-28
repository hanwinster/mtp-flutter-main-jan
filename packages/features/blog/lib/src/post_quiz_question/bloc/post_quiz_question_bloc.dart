import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

part 'post_quiz_question_event.dart';

part 'post_quiz_question_state.dart';

class PostQuizQuestionBloc
    extends Bloc<PostQuizQuestionEvent, PostQuizQuestionState> {
  PostQuizQuestionBloc({
    required String postId,
    required int currentQuestionIndex,
    required bool isFirstQuestion,
    required bool isLastQuestion,
    required BlogPostQuizQuestion question,
    SaveBlogPostQuizAnswersUseCase? saveBlogPostQuizAnswerUseCase,
  })  : _saveBlogPostQuizAnswerUseCase =
            saveBlogPostQuizAnswerUseCase ?? getIt(),
        super(PostQuizQuestionState.create(
          postId: postId,
          currentQuestionIndex: currentQuestionIndex,
          question: question,
          isFirstQuestion: isFirstQuestion,
          isLastQuestion: isLastQuestion,
        )) {
    on<PostQuizQuestionSubmitted>(_handleSubmitted);
  }

  final SaveBlogPostQuizAnswersUseCase _saveBlogPostQuizAnswerUseCase;

  Future<void> _handleSubmitted(
    PostQuizQuestionSubmitted event,
    Emitter<PostQuizQuestionState> emit,
  ) async {
    final userAnswer = event.answersByQuestionId[state.question.id];
    if (userAnswer == null) {
      return;
    }

    final answersByIndex = <int, String>{};
    switch (userAnswer) {
      case UserTextAnswer():
        // no-op
        logger.d('UserTextAnswer: $userAnswer');
      case UserOptionAnswer():
        answersByIndex[0] = userAnswer.option.id;
      case UserOptionListAnswer():
        if (state.question.type == BlogPostQuizQuestionType.multipleChoice) {
          final userAnswerOptionIds =
              userAnswer.options.map((e) => e.id).toList();
          userAnswerOptionIds.sort();

          for (final (index, optionId) in userAnswerOptionIds.indexed) {
            answersByIndex[index] = optionId;
          }
        } else if (state.question.type == BlogPostQuizQuestionType.rearrange) {
          for (final (index, option) in userAnswer.options.indexed) {
            answersByIndex[index] = option.id;
          }
        }
      case UserOptionMapAnswer():
        final userAnswerOptionsByPrompt = userAnswer.optionsByPrompt.values;
        for (final (index, option) in userAnswerOptionsByPrompt.indexed) {
          answersByIndex[index] = option.id;
        }
        // var index = 0;
        // for (final option in state.question.options) {
        //   if (userAnswerOptionsByPrompt.keys
        //       .map((e) => e.id)
        //       .contains(option)) {
        //     final userAnswerOption = userAnswerOptionsByPrompt.entries
        //         .firstWhere((e) => e.key.id == option)
        //         .value
        //         .id;
        //     answersByIndex[index] = userAnswerOption;
        //     index++;
        //   }
        // }
      case UserOptionsByIndexAnswer():
        // no-op
        logger.d('UserOptionsByIndexAnswer: $userAnswer');
    }

    await saveAnswer(emit, answersByIndex);
  }

  Future<void> saveAnswer(
    Emitter<PostQuizQuestionState> emit,
    Map<int, String> answersByIndex,
  ) async {
    emit(
      state.copyWith(
        submissionUiState: const UiStateInProgress(),
      ),
    );

    logger.d('Saving answer: $answersByIndex');
    try {
      await _saveBlogPostQuizAnswerUseCase(
        SaveBlogPostQuizAnswersUseCaseRequest(
          postId: state.postId,
          question: state.question,
          answersByIndex: answersByIndex,
        ),
      );
      emit(
        state.copyWith(
          submissionUiState: const UiStateSuccess(NullValue()),
        ),
      );
    } catch (e, s) {
      logger.e('Failed to save answer', e, s);
      emit(
        state.copyWith(
          submissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
