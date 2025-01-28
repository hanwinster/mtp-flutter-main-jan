import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_dashboard/ui/components/components.dart';
import 'package:ui/ui.dart';

List<Widget> buildLiveSessionList(
  BuildContext context, {
  required String courseId,
  required List<CourseMaterial> liveSessionMaterials,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  final widgets = <Widget>[];
  for (final (index, material) in liveSessionMaterials.indexed) {
    final tile = TitleTile(
      title: material.title,
      isCompleted: material.isCompleted,
      onTap: () => navigationEventHandler.onLiveSessionEvent(
        liveSessionId: material.id,
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

Widget buildFlexibleLiveSessionTile(
  BuildContext context, {
  required String courseId,
  required CourseMaterial liveSessionMaterial,
  required CourseNavigationEventHandler navigationEventHandler,
}) {
  return SliverSectionTile(
    title: liveSessionMaterial.title,
    isCompleted: liveSessionMaterial.isCompleted,
    onTap: () => navigationEventHandler.onLiveSessionEvent(
      liveSessionId: liveSessionMaterial.id,
      materialKey: liveSessionMaterial.key,
      direction: CourseNavigationDirection.next,
    ),
  );
}

Widget _separator(BuildContext context) {
  return const SizedBox(height: Grid.one);
}
