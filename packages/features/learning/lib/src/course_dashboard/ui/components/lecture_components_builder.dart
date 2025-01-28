import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_dashboard/ui/components/components.dart';
import 'package:learning/src/course_dashboard/ui/components/default_order_material_expansion_tile.dart';
import 'package:ui/ui.dart';

List<Widget> buildLectureList(
  BuildContext context, {
  required List<CourseMaterial> lectureMaterials,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  final widgets = <Widget>[];

  for (final (index, material) in lectureMaterials.indexed) {
    if (!material.hasSubmodules) {
      final tile = TitleTile(
        title: material.title,
        isCompleted: material.isCompleted,
        onTap: () => navigationEventHandler.onLectureEvent(
          lectureId: material.id,
          materialKey: material.key,
          direction: CourseNavigationDirection.next,
        ),
      );

      if (index > 0) {
        widgets.add(_separator(context));
      }

      widgets.add(tile);
    } else {
      final tile = DefaultOrderMaterialExpansionTile(
        title: material.title,
        isCompleted: material.isAllSubModulesCompleted,
        children: [
          SubmoduleTitleTile(
            onTap: () => navigationEventHandler.onLectureEvent(
              lectureId: material.id,
              materialKey: material.key,
              direction: CourseNavigationDirection.next,
            ),
            title: context.l10n.courseLabelLecture,
            isCompleted: material.isCompleted,
          ),
          ...material.submodules.map(
            (submodule) {
              if (submodule.type == CourseMaterialType.learningActivity) {
                return SubmoduleTitleTile(
                  title: submodule.title,
                  isCompleted: submodule.isCompleted,
                  onTap: () => navigationEventHandler.onLearningActivityEvent(
                    activityId: submodule.id,
                    materialKey: submodule.key,
                    direction: CourseNavigationDirection.next,
                  ),
                );
              } else if (submodule.type == CourseMaterialType.quiz) {
                return SubmoduleTitleTile(
                  title: submodule.title,
                  isCompleted: submodule.isCompleted,
                  onTap: () => navigationEventHandler.onQuizEvent(
                    quizId: submodule.id,
                    materialKey: submodule.key,
                    direction: CourseNavigationDirection.next,
                  ),
                );
              } else if (submodule.type == CourseMaterialType.summary) {
                return SubmoduleTitleTile(
                  title: submodule.title,
                  isCompleted: submodule.isCompleted,
                  onTap: () => navigationEventHandler.onSummaryEvent(
                    summaryId: submodule.id,
                    materialKey: submodule.key,
                    direction: CourseNavigationDirection.next,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      );
      if (index > 0) {
        widgets.add(_separator(context));
      }
      widgets.add(tile);
    }
  }
  return widgets;
}

Widget buildFlexibleLectureTile(
  BuildContext context, {
  required CourseMaterial lectureMaterial,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  if (!lectureMaterial.hasSubmodules) {
    return SliverSectionTile(
        title: lectureMaterial.title,
        isCompleted: lectureMaterial.isCompleted,
        onTap: () {
          navigationEventHandler.onLectureEvent(
            lectureId: lectureMaterial.id,
            materialKey: lectureMaterial.key,
            direction: CourseNavigationDirection.next,
          );
        });
  }

  return SliverExpansionSectionTile(
    title: lectureMaterial.title,
    isCompleted: lectureMaterial.isAllSubModulesCompleted,
    children: [
      SubmoduleTitleTile(
        onTap: () => navigationEventHandler.onLectureEvent(
          lectureId: lectureMaterial.id,
          materialKey: lectureMaterial.key,
          direction: CourseNavigationDirection.next,
        ),
        title: context.l10n.courseLabelLecture,
        isCompleted: lectureMaterial.isCompleted,
      ),
      ...lectureMaterial.submodules.map((submodule) {
        if (submodule.type == CourseMaterialType.learningActivity) {
          return SubmoduleTitleTile(
            onTap: () => navigationEventHandler.onLearningActivityEvent(
              activityId: submodule.id,
              materialKey: submodule.key,
              direction: CourseNavigationDirection.next,
            ),
            title: submodule.title,
            isCompleted: submodule.isCompleted,
          );
        } else if (submodule.type == CourseMaterialType.quiz) {
          return SubmoduleTitleTile(
            onTap: () => navigationEventHandler.onQuizEvent(
              materialKey: submodule.key,
              quizId: submodule.id,
              direction: CourseNavigationDirection.next,
            ),
            title: submodule.title,
            isCompleted: submodule.isCompleted,
          );
        } else if (submodule.type == CourseMaterialType.summary) {
          return SubmoduleTitleTile(
            onTap: () => navigationEventHandler.onSummaryEvent(
              summaryId: submodule.id,
              materialKey: submodule.key,
              direction: CourseNavigationDirection.next,
            ),
            title: submodule.title,
            isCompleted: submodule.isCompleted,
          );
        } else if (submodule.type == CourseMaterialType.quiz) {
          return SubmoduleTitleTile(
            onTap: () => navigationEventHandler.onQuizEvent(
              materialKey: submodule.key,
              quizId: submodule.id,
              direction: CourseNavigationDirection.next,
            ),
            title: submodule.title,
            isCompleted: submodule.isCompleted,
          );
        } else {
          return const SizedBox();
        }
      }),
    ],
  );
}

Widget _separator(BuildContext context) {
  return const SizedBox(height: Grid.one);
}
