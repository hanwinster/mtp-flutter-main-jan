import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';
import 'components.dart';

class FlexibleOrderCourseDashboardContent extends StatelessWidget {
  const FlexibleOrderCourseDashboardContent({
    super.key,
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    final materials = course.orderedCourseMaterials;

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
          ...materials.map((material) {
            if (material.type == CourseMaterialType.intro) {
              return SliverSectionTile(
                title: context.l10n.courseLabelIntroudction,
                isCompleted: material.isCompleted,
                onTap: () {
                  navigationEventHandler.onIntroductionEvent(
                    materialKey: material.key,
                    direction: CourseNavigationDirection.next,
                  );
                },
              );
            } else if (material.type == CourseMaterialType.lecture) {
              return buildFlexibleLectureTile(
                context,
                lectureMaterial: material,
                navigationEventHandler: navigationEventHandler,
              );
            } else if (material.type == CourseMaterialType.learningActivity) {
              return buildFlexibleLearningActivityTile(
                context,
                courseId: course.id,
                material: material,
                navigationEventHandler: navigationEventHandler,
              );
            } else if (material.type == CourseMaterialType.summary) {
              return buildFlexibleSummaryTile(
                context,
                courseId: course.id,
                summaryMaterial: material,
                navigationEventHandler: navigationEventHandler,
              );
            } else if (material.type == CourseMaterialType.quiz) {
              return buildFlexibleQuizTile(
                context,
                courseId: course.id,
                quizMaterial: material,
                navigationEventHandler: navigationEventHandler,
              );
            } else if (material.type == CourseMaterialType.liveSession) {
              return buildFlexibleLiveSessionTile(
                context,
                courseId: course.id,
                liveSessionMaterial: material,
                navigationEventHandler: navigationEventHandler,
              );
            }
            return const SliverSizedBox(height: Grid.zero);
          }),
          if (course.hasAssessment) ...[
            buildFlexibleAssessmentTile(
              context,
              isCompleted: course.hasLearnerCompletedAllAssessments,
              materials: course.assessmentMaterials,
              navigationEventHandler: navigationEventHandler,
              isReadyForAssessment: course.isLearnerReadyForAssessment,
            )
          ],
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
