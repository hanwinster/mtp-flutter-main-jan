import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';
import 'components.dart';

class DefaultOrderCourseDashboardContent extends StatelessWidget {
  const DefaultOrderCourseDashboardContent({
    super.key,
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    final introMaterial = course.introMaterial;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: CustomScrollView(
        slivers: [
          const SliverSizedBox(height: Grid.one),
          SliverToBoxAdapter(
            child: HeaderSection(
              course: course,
              navigationEventHandler: navigationEventHandler,
            ),
          ),
          const SliverSizedBox(height: Grid.two),
          if (introMaterial != null) ...[
            SliverSectionTile(
              title: context.l10n.courseLabelIntroudction,
              isCompleted: introMaterial.isCompleted,
              onTap: () {
                navigationEventHandler.onIntroductionEvent(
                  materialKey: introMaterial.key,
                  direction: CourseNavigationDirection.next,
                );
              },
            ),
          ],
          const SliverSectionDivider(),
          SliverExpansionSectionTile(
            title: context.l10n.courseLabelLectures,
            isCompleted: course.lectureMaterials
                .every((material) => material.isCompleted),
            children: buildLectureList(
              context,
              lectureMaterials: course.lectureMaterials,
              navigationEventHandler: navigationEventHandler,
            ),
          ),
          if (course.learningActivityMaterials.isNotEmpty) ...[
            const SliverSectionDivider(),
            SliverExpansionSectionTile(
              title: context.l10n.courseLabelLearningActivities,
              isCompleted: course.learningActivityMaterials
                  .every((material) => material.isCompleted),
              children: buildLearningActivityList(
                context,
                courseId: course.id,
                learningActivityMaterials: course.learningActivityMaterials,
                navigationEventHandler: navigationEventHandler,
              ),
            ),
          ],
          if (course.quizMaterials.isNotEmpty) ...[
            const SliverSectionDivider(),
            SliverExpansionSectionTile(
              title: context.l10n.courseLabelQuizzes,
              isCompleted: course.quizMaterials
                  .every((material) => material.isCompleted),
              children: buildQuizList(
                context,
                courseId: course.id,
                quizMaterials: course.quizMaterials,
                navigationEventHandler: navigationEventHandler,
              ),
            ),
          ],
          if (course.liveSessionMaterials.isNotEmpty) ...[
            const SliverSectionDivider(),
            SliverExpansionSectionTile(
              title: context.l10n.courseLabelLiveSessions,
              isCompleted: course.liveSessionMaterials
                  .every((material) => material.isCompleted),
              children: buildLiveSessionList(
                context,
                courseId: course.id,
                liveSessionMaterials: course.liveSessionMaterials,
                navigationEventHandler: navigationEventHandler,
              ),
            ),
          ],
          if (course.summaryMaterials.isNotEmpty) ...[
            const SliverSectionDivider(),
            SliverExpansionSectionTile(
              title: context.l10n.courseLabelSummaries,
              isCompleted: course.summaryMaterials
                  .every((material) => material.isCompleted),
              children: buildSummaryList(
                context,
                courseId: course.id,
                summaryMaterials: course.summaryMaterials,
                navigationEventHandler: navigationEventHandler,
              ),
            ),
          ],
          if (course.hasAssessment) ...[
            const SliverSectionDivider(),
            if (!course.isLearnerReadyForAssessment)
              SliverSectionTile(
                title: context.l10n.courseLabelAssessment,
                isCompleted: false,
                showCompleteStatusIndicator: true,
                onTap: () {
                  showSnackBar(
                      context, context.l10n.courseDashboardLabelAssessmentInfo);
                },
              ),
            if (course.isLearnerReadyForAssessment)
              SliverExpansionSectionTile(
                title: context.l10n.courseLabelAssessment,
                isCompleted: course.assessmentMaterials
                    .every((material) => material.isCompleted),
                children: buildAssessmentList(
                  context,
                  courseId: course.id,
                  materials: course.assessmentMaterials,
                  navigationEventHandler: navigationEventHandler,
                ),
              ),
          ],
          const SliverSectionDivider(),
          SliverSectionTile(
            title: context.l10n.courseLabelEvaluations,
            isCompleted: false,
            showCompleteStatusIndicator: false,
            onTap: () {
              if (course.isLearnerReadyForEvaluation) {
                navigationEventHandler.onEvaluationEvent();
              } else {
                showSnackBar(
                    context, context.l10n.courseDashboardLabelEvaluationInfo);
              }
            },
          ),
          const SliverSizedBox(height: Grid.two),
          SliverToBoxAdapter(
            child: GenerateCertificateButton(
              isCourseCompleted: course.isCompleted,
            ),
          ),
        ],
      ),
    );
  }
}
