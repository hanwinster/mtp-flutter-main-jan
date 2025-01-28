import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_dashboard/ui/components/components.dart';
import 'package:ui/ui.dart';

List<Widget> buildQuizList(
  BuildContext context, {
  required String courseId,
  required List<CourseMaterial> quizMaterials,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  final widgets = <Widget>[];
  for (final (index, material) in quizMaterials.indexed) {
    final tile = TitleTile(
      title: material.title,
      isCompleted: material.isCompleted,
      onTap: () => navigationEventHandler.onQuizEvent(
        quizId: material.id,
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

Widget buildFlexibleQuizTile(
  BuildContext context, {
  required String courseId,
  required CourseMaterial quizMaterial,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  return SliverSectionTile(
    title: quizMaterial.title,
    isCompleted: quizMaterial.isCompleted,
    onTap: () => navigationEventHandler.onQuizEvent(
      quizId: quizMaterial.id,
      materialKey: quizMaterial.key,
      direction: CourseNavigationDirection.next,
    ),
  );
}

Widget _separator(BuildContext context) {
  return const SizedBox(height: Grid.one);
}
