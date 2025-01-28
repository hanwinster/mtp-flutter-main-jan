import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/home/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../bloc/home_bloc/home_bloc.dart';
import '../home_screen_entry.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({
    super.key,
    required this.onExploreCourseClick,
    required this.onCourseClick,
  });

  final ExploreCourseClickCallback onExploreCourseClick;
  final CourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionHeader(
                text: context.l10n.homeLabelCourses,
              ),
              MtpTextButton(
                labelText: context.l10n.homeButtonTextSeeAllCourses,
                onPressed: () => onExploreCourseClick(),
              ),
            ],
          ),
        ),
        const SizedBox(height: Grid.half),
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.coursesUiState != current.coursesUiState,
          builder: (context, state) {
            return state.coursesUiState.toView(
              context,
              successViewBuilder: (courses) {
                return _CourseList(
                  courses: courses,
                  onExploreCourseClick: onExploreCourseClick,
                  onCourseClick: onCourseClick,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _CourseList extends StatelessWidget {
  const _CourseList({
    required this.courses,
    required this.onExploreCourseClick,
    required this.onCourseClick,
  });

  final List<Course> courses;
  final ExploreCourseClickCallback onExploreCourseClick;
  final CourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemWidth = screenWidth / 2.1;
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: Grid.two),
            for (final (index, course) in courses.indexed) ...[
              if (index > 0) const SizedBox(width: Grid.one),
              _CourseTitle(
                course: course,
                itemWidth: itemWidth,
                onTap: () => onCourseClick(course.id),
              ),
            ],
            const SizedBox(width: Grid.one),
            _SeeAllTile(
              itemWidth: itemWidth,
              onTap: () => onExploreCourseClick(),
            ),
            const SizedBox(width: Grid.two),
          ],
        ),
      ),
    );
  }
}

class _CourseTitle extends StatelessWidget {
  const _CourseTitle({
    required this.course,
    required this.itemWidth,
    required this.onTap,
  });

  final Course course;
  final double itemWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: itemWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: defaultImageAspectRatio,
                  child: MtpImage(
                    course.coverImage.medium,
                  ),
                ),
                const SizedBox(height: Grid.one),
                MtpHtmlPlainText(
                  course.title,
                  textStyle: context.textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeeAllTile extends StatelessWidget {
  const _SeeAllTile({
    required this.itemWidth,
    required this.onTap,
  });

  final double itemWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward),
              const SizedBox(height: Grid.one),
              Text(
                context.l10n.homeButtonTextSeeAllCourses,
                style: context.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
