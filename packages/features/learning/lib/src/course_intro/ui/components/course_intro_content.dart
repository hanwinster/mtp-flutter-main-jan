import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common/common.dart';
import 'package:ui/ui.dart';

class CourseIntroContent extends StatelessWidget {
  CourseIntroContent({
    super.key,
    required this.course,
    required this.learner,
    required String materialKey,
    required CourseNavigationEventHandler navigationEventHandler,
  }) : courseNavigator = CourseNavigator(
          materialKey: materialKey,
          learner: learner,
          navigationEventHandler: navigationEventHandler,
        );

  final Course course;
  final CourseLearner learner;
  final CourseNavigator courseNavigator;

  @override
  Widget build(BuildContext context) {
    return LearningAreaContainer(
      navigationButtonBar: CourseNavigationButtonBar(
        courseNavigator: courseNavigator,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MtpHtmlPlainText(
              course.title,
              textStyle: context.textTheme.titleMedium,
            ),
            const SizedBox(height: Grid.two),
            if (course.isDisplayVideo && course.videoUrl.isNotEmpty) ...[
              MtpVideoPlayer(videoUrl: course.videoUrl),
              const SizedBox(height: Grid.two),
            ],
            if (course.coverImage.large.isNotEmpty && !course.isDisplayVideo) ...[
              const SizedBox(height: Grid.two),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: MtpImage(
                  course.coverImage.large,
                  width: double.infinity,
                ),
              ),
            ],
            _CourseDescriptionSection(
              course: course,
            ),
            const SizedBox(height: Grid.two),
            _CourseObjectiveSection(course: course),
            const SizedBox(height: Grid.two),
            if (course.learningOutcome.isNotEmpty) ...[
              _LearningOutcomeSection(course: course),
              const SizedBox(height: Grid.two),
            ],
            if (course.urlLink.isNotEmpty) ...[
              const SizedBox(height: Grid.two),
              _ResourceSection(course: course),
            ],
          ],
        ),
      ),
    );
  }
}

class _CourseDescriptionSection extends StatelessWidget {
  const _CourseDescriptionSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: context.l10n.courseLabelCourseDescription),
        const SizedBox(height: Grid.one),
        _SectionBody(html: course.description),
      ],
    );
  }
}

class _CourseObjectiveSection extends StatelessWidget {
  const _CourseObjectiveSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: context.l10n.courseLabelCourseObjectives),
        const SizedBox(height: Grid.one),
        _SectionBody(html: course.objective),
      ],
    );
  }
}

class _LearningOutcomeSection extends StatelessWidget {
  const _LearningOutcomeSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: context.l10n.courseLabelCourseLearningOutcomes),
        const SizedBox(height: Grid.one),
        _SectionBody(html: course.learningOutcome),
      ],
    );
  }
}

class _ResourceSection extends StatelessWidget {
  const _ResourceSection({required this.course});

  final Course course;

  String _parseFileNames(String url) {
    Uri uri = Uri.parse(url);
    String fileName = uri.pathSegments.last;
    return fileName;
  }

  @override
  Widget build(BuildContext context) {
    final link = course.urlLink;
    final html = '<a href="$link">$link</a>';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: context.l10n.courseLabelCourseResourceLink),
        const SizedBox(height: Grid.one),
        _SectionBody(
          html: html,
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleSmall,
    );
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody({required this.html});

  final String html;

  @override
  Widget build(BuildContext context) {
    return MtpHtml(
      html,
      textStyle: context.textTheme.bodyMedium,
    );
  }
}
