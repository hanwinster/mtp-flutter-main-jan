import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';
import 'components.dart';

class XApiCourseDashboardContent extends StatelessWidget {
  const XApiCourseDashboardContent({
    super.key,
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
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
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              child: MtpOutlinedButton(
                onPressed: () {
                  final xApiMaterial = course.xApiMaterial;
                  if (xApiMaterial == null) {
                    return;
                  }
                  navigationEventHandler.onXApiCourseEvent(
                    materialKey: xApiMaterial.key,
                    direction: CourseNavigationDirection.next,
                  );
                },
                labelText: context.l10n.courseLabelLectures,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
