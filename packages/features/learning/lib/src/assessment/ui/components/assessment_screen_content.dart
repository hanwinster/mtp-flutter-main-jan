import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/assessment/ui/components/assessment_question_sheet.dart';
import 'package:learning/src/assessment/ui/components/correct_answers_section.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import 'assessment_buttons.dart';

class AssessmentScreenContent extends StatelessWidget {
  AssessmentScreenContent({
    super.key,
    required this.question,
    required this.learner,
    required String materialKey,
    required CourseNavigationEventHandler navigationEventHandler,
    required this.questionSheetController,
  }) : courseNavigator = CourseNavigator(
          materialKey: materialKey,
          learner: learner,
          navigationEventHandler: navigationEventHandler,
        );

  final AssessmentQuestion question;
  final CourseLearner learner;
  final CourseNavigator courseNavigator;
  final QuestionSheetController questionSheetController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LearningAreaContainer(
          navigationButtonBar: AssessmentNavigationButtonBar(
            courseNavigator: courseNavigator,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: AssessmentQuestionSheet(
              questionSheetController: questionSheetController,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: Grid.two),
          child: ShowCorrectAnswersButton(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: Grid.two),
          child: CorrectAnswersSection(),
        ),
      ],
    );
  }
}
