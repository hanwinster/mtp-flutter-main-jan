import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/common.dart';
import 'package:learning/src/quiz/ui/quiz_question_mapper.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';
import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/quiz_bloc.dart';
import 'components/components.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionSheetController questionSheetController =
      QuestionSheetController();

  @override
  Widget build(BuildContext context) {
    return LearningScreenScaffold(
      navigationEventHandler: widget.navigationEventHandler,
      isOfflineMode: widget.isOfflineMode,
      onSwitchToOnline: widget.onSwitchToOnline,
      slivers: [
        MultiBlocListener(
          listeners: [
            BlocListener<QuizBloc, QuizState>(
              listenWhen: (previous, current) =>
                  previous.answerSubmissionUiState !=
                  current.answerSubmissionUiState,
              listener: (context, state) {
                if (state.answerSubmissionUiState is UiStateFailure) {
                  showSnackBar(context,
                      state.answerSubmissionUiState.messageOrEmpty(context));
                } else if (state.answerSubmissionUiState is UiStateSuccess) {
                  final String message =
                      state.answerSubmissionUiState.dataOrNull ?? '';
                  if (message.isNotEmpty) {
                    showSnackBar(context, message);
                  }
                }
              },
            ),
            BlocListener<CourseLearnerBloc, CourseLearnerState>(
              listenWhen: (previous, current) =>
                  previous.learnerUiState != current.learnerUiState,
              listener: (context, state) {
                context
                    .read<QuizBloc>()
                    .add(QuizLearnerChanged(state.learnerUiState));
              },
            ),
            BlocListener<QuizBloc, QuizState>(
              listenWhen: (previous, current) =>
                  previous.quizUiState != current.quizUiState,
              listener: (context, state) {
                final quiz = state.quizUiState.dataOrNull;
                if (quiz != null) {
                  final questions =
                      mapQuizQuestions(context: context, quiz: quiz);
                  questionSheetController.setQuestions(questions);
                }
              },
            ),
          ],
          child: BlocBuilder<QuizBloc, QuizState>(
            buildWhen: (previous, current) =>
                previous.quizUiState != current.quizUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.quizUiState.toSliverView(
                context,
                successViewBuilder: (quiz) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: QuizScreenContent(
                      quiz: quiz,
                      learner: learner,
                      materialKey: state.materialKey,
                      navigationEventHandler: widget.navigationEventHandler,
                      questionSheetController: questionSheetController,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
