import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/common.dart';
import '../bloc/assessment_bloc.dart';
import 'assessment_question_mapper.dart';
import 'components/components.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({
    super.key,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final QuestionSheetController _questionSheetController =
      QuestionSheetController();

  @override
  Widget build(BuildContext context) {
    return LearningScreenScaffold(
      isOfflineMode: widget.isOfflineMode,
      onSwitchToOnline: widget.onSwitchToOnline,
      navigationEventHandler: widget.navigationEventHandler,
      slivers: [
        MultiBlocListener(
          listeners: [
            BlocListener<CourseLearnerBloc, CourseLearnerState>(
              listenWhen: (previous, current) =>
                  previous.learnerUiState != current.learnerUiState,
              listener: (context, state) {
                context
                    .read<AssessmentBloc>()
                    .add(AssessmentLearnerChanged(state.learnerUiState));
              },
            ),
            BlocListener<AssessmentBloc, AssessmentState>(
              listenWhen: (previous, current) =>
                  previous.saveAssessmentUiState !=
                  current.saveAssessmentUiState,
              listener: (context, state) {
                if (state.saveAssessmentUiState is UiStateFailure) {
                  showSnackBar(
                      context,
                      state.saveAssessmentUiState
                          .messageOrEmpty(context));
                }
              },
            ),
            BlocListener<AssessmentBloc, AssessmentState>(
              listenWhen: (previous, current) =>
                  previous.assessmentSubmissionUiState !=
                  current.assessmentSubmissionUiState,
              listener: (context, state) {
                if (state.assessmentSubmissionUiState is UiStateSuccess) {
                  final result = state.assessmentSubmissionUiState.dataOrThrow;
                  if (result.isPass) {
                    widget.navigationEventHandler.onEvaluationEvent();
                  } else {
                    final message =
                        "${result.message}\n${result.proceedMessage}";
                    showSnackBar(context, message);
                  }
                } else if (state.assessmentSubmissionUiState
                    is UiStateFailure) {
                  showSnackBar(
                      context,
                      state.assessmentSubmissionUiState
                          .messageOrEmpty(context));
                }
              },
            ),
            BlocListener<AssessmentBloc, AssessmentState>(
              listenWhen: (previous, current) =>
                  previous.questionUiState != current.questionUiState,
              listener: (context, state) {
                final assessmentQuestion = state.questionUiState.dataOrNull;
                if (assessmentQuestion == null) {
                  return;
                }
                final question = mapToQuestionData(
                  context,
                  question: assessmentQuestion,
                );
                _questionSheetController.setQuestions([question]);

                final userAnswer = assessmentQuestion.userAnswer;
                if (userAnswer != null) {
                  _questionSheetController.updateAnswer(
                      assessmentQuestion.id,
                      mapToUserAnswer(
                        context: context,
                        question: assessmentQuestion,
                        answers: userAnswer.answers,
                      ));
                }
              },
            ),
          ],
          child: BlocBuilder<AssessmentBloc, AssessmentState>(
            buildWhen: (previous, current) =>
                previous.questionUiState != current.questionUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.questionUiState.toSliverView(context,
                  successViewBuilder: (assessment) {
                final learner = state.courseLearnerUiState.dataOrNull;
                if (learner == null) {
                  return const SliverToBoxAdapter(
                    child: MtpLoading(),
                  );
                }
                return SliverToBoxAdapter(
                  child: AssessmentScreenContent(
                    question: assessment,
                    learner: learner,
                    materialKey: state.materialKey,
                    navigationEventHandler: widget.navigationEventHandler,
                    questionSheetController: _questionSheetController,
                  ),
                );
              }, onRetried: () {
                context.read<AssessmentBloc>().add(
                      const AssessmentQuestionFetched(),
                    );
              });
            },
          ),
        ),
      ],
    );
  }
}
