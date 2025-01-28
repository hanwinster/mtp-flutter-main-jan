import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import 'components.dart';

class QuizScreenContent extends StatelessWidget {
  QuizScreenContent({
    super.key,
    required this.quiz,
    required this.learner,
    required String materialKey,
    required CourseNavigationEventHandler navigationEventHandler,
    required this.questionSheetController,
  }) : courseNavigator = CourseNavigator(
          materialKey: materialKey,
          learner: learner,
          navigationEventHandler: navigationEventHandler,
        );

  final LearningQuiz quiz;
  final CourseLearner learner;
  final CourseNavigator courseNavigator;
  final QuestionSheetController questionSheetController;

  @override
  Widget build(BuildContext context) {
    logger.d('Question count: ${quiz.questions.length}');
    return LearningAreaContainer(
      navigationButtonBar: QuizNavigationButtonBar(
        courseNavigator: courseNavigator,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: quiz.isAssignmentQuiz
            ? AssignmentQuestionSheet(quiz: quiz)
            : QuizQuestionSheet(
                quiz: quiz,
                controller: questionSheetController,
              ),
      ),
    );
  }
}
