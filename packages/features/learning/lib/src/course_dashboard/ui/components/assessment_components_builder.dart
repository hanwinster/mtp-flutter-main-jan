import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_dashboard/ui/components/components.dart';
import 'package:ui/ui.dart';

List<Widget> buildAssessmentList(
  BuildContext context, {
  required String courseId,
  required List<CourseMaterial> materials,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  final widgets = <Widget>[];
  for (final (index, material) in materials.indexed) {
    final tile = TitleTile(
      title: material.title,
      isCompleted: material.isCompleted,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      onTap: () => navigationEventHandler.onAssessmentEvent(
        assessmentId: material.id,
        materialKey: material.key,
        direction: CourseNavigationDirection.next,
      ),
    );
    if (index > 0) {
      widgets.add(_separator(context));
    }
    widgets.add(tile);
  }
  return widgets;
}

Widget buildFlexibleAssessmentTile(
  BuildContext context, {
  required bool isCompleted,
  required List<CourseMaterial> materials,
  required CourseNavigationEventHandler navigationEventHandler,
  required bool isReadyForAssessment,
}) {
  if (!isReadyForAssessment) {
    return SliverSectionTile(
        title: context.l10n.courseLabelAssessment,
        isCompleted: false,
        showCompleteStatusIndicator: true,
        onTap: () {
            showSnackBar(
                context, context.l10n.courseDashboardLabelAssessmentInfo);
        });
  }

  return SliverExpansionSectionTile(
    title: context.l10n.courseLabelAssessment,
    isCompleted: isCompleted,
    children: [
      ...materials.map((material) {
        return SubmoduleTitleTile(
          onTap: () => navigationEventHandler.onAssessmentEvent(
            assessmentId: material.id,
            materialKey: material.key,
            direction: CourseNavigationDirection.next,
          ),
          title: material.title,
          isCompleted: material.isCompleted,
          showThumbnail: false,
        );
      }),
    ],
  );
}

Widget _separator(BuildContext context) {
  return const SizedBox(height: Grid.one);
}
