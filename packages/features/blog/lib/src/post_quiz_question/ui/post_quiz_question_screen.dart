import 'package:base/base.dart';
import 'package:blog/src/post_quiz_question/ui/blog_post_quiz_question_mapper.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../post_quiz/bloc/bloc.dart';
import '../bloc/post_quiz_question_bloc.dart';

class PostQuizQuestionScreen extends StatefulWidget {
  const PostQuizQuestionScreen({
    super.key,
    required this.currentQuestionIndex,
    required this.question,
    required this.onPageIndexChanged,
    required this.onSubmitted,
  });

  final int currentQuestionIndex;
  final BlogPostQuizQuestion question;
  final Function() onSubmitted;
  final Function(int) onPageIndexChanged;

  @override
  State<PostQuizQuestionScreen> createState() => _PostQuizQuestionScreenState();
}

class _PostQuizQuestionScreenState extends State<PostQuizQuestionScreen>
with AutomaticKeepAliveClientMixin<PostQuizQuestionScreen> {
  final QuestionSheetController _questionSheetController =
      QuestionSheetController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _questionSheetController
          .setQuestions([mapToQuestionData(context, widget.question)]);

      final userAnswer = widget.question.userAnswer;
      if (userAnswer != null) {
        _questionSheetController.updateAnswer(
            widget.question.id,
            mapToUserAnswer(
              context: context,
              question: widget.question,
              answers: userAnswer.answers,
            ));
      }
    });
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<PostQuizQuestionBloc, PostQuizQuestionState>(
          listenWhen: (previous, current) =>
              previous.question != current.question,
          listener: (context, state) {
            final userAnswer = state.question.userAnswer;
            logger.d('User answer: $userAnswer');
          },
        ),
        BlocListener<PostQuizQuestionBloc, PostQuizQuestionState>(
          listenWhen: (previous, current) =>
              previous.submissionUiState != current.submissionUiState,
          listener: (context, state) {
            if (state.submissionUiState is UiStateSuccess) {
              if (state.isLastQuestion) {
                widget.onSubmitted();
              } else {
                widget.onPageIndexChanged(state.currentQuestionIndex + 1);
              }
            } else if (state.submissionUiState is UiStateFailure) {
              showSnackBar(
                  context, state.submissionUiState.messageOrEmpty(context));
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: Grid.four),
        child: Column(
          children: [
            QuestionSheet(
              controller: _questionSheetController,
              onValidationCompleted: () {
                final answersById =
                    _questionSheetController.getAnswersByQuestionId();
                context
                    .read<PostQuizQuestionBloc>()
                    .add(PostQuizQuestionSubmitted(answersById));
              },
              withScaffold: false,
              decoration: QuestionSheetDecoration(
                questionTextStyle: QuestionTextStyle(
                  textStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                textInputHint: context.l10n.courseLabelQuestionTextInputHint,
                singleChoiceQuestionStyle: SingleChoiceQuestionStyle(
                  optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                  radioActiveColor: context.colorScheme.primary,
                ),
                matchingQuestionStyle: MatchingQuestionStyle(
                  promptTextStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                  optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                multipleChoiceQuestionStyle: MultipleChoiceQuestionStyle(
                  optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                  checkBoxActiveColor: context.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: Grid.two),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Grid.two),
              child: Row(
                children: [
                  Expanded(child: _PreviousButton(
                    onPressed: () {
                      widget.onPageIndexChanged(widget.currentQuestionIndex - 1);
                    },
                  )),
                  const SizedBox(width: Grid.one),
                  Expanded(
                      child: BlocBuilder<PostQuizQuestionBloc,
                          PostQuizQuestionState>(
                    buildWhen: (previous, current) =>
                        previous.isLastQuestion != current.isLastQuestion,
                    builder: (context, state) {
                      return _NextButton(
                        isLastQuestion: state.isLastQuestion,
                        onPressed: () {
                          _questionSheetController.validate();
                        },
                      );
                    },
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    required this.isLastQuestion,
    required this.onPressed,
  });

  final bool isLastQuestion;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostQuizBloc, PostQuizState>(
      buildWhen: (previous, current) =>
          previous.userAnswersSubmissionUiState !=
          current.userAnswersSubmissionUiState,
      builder: (context, state) {
        final submitQuizInProgress =
            state.userAnswersSubmissionUiState.isInProgress;
        return BlocBuilder<PostQuizQuestionBloc, PostQuizQuestionState>(
          buildWhen: (previous, current) =>
              previous.submissionUiState != current.submissionUiState,
          builder: (context, state) {
            final saveQuestionInProgress = state.submissionUiState.isInProgress;
            return MtpPrimarySubmitButton(
              isInProgress: saveQuestionInProgress || submitQuizInProgress,
              onPressed: onPressed,
              labelText: isLastQuestion
                  ? context.l10n.blogPostQuizButtonTextSubmit
                  : context.l10n.blogPostQuizButtonTextNext,
            );
          },
        );
      },
    );
  }
}

class _PreviousButton extends StatelessWidget {
  const _PreviousButton({
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostQuizQuestionBloc, PostQuizQuestionState>(
      buildWhen: (previous, current) =>
          previous.submissionUiState != current.submissionUiState ||
          previous.isFirstQuestion != current.isFirstQuestion,
      builder: (context, state) {
        return MtpOutlinedButton(
          onPressed:
              state.isFirstQuestion || state.submissionUiState.isInProgress
                  ? null
                  : onPressed,
          labelText: context.l10n.blogPostQuizButtonTextPrevious,
        );
      },
    );
  }
}
