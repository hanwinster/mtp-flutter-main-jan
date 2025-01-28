import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common/ui/components/offline_media_view.dart';
import 'package:ui/ui.dart';

class CourseOverviewPage extends StatelessWidget {
  const CourseOverviewPage({
    super.key,
    required this.course,
    required this.isOfflineMode,
  });

  final Course course;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Grid.two,
        top: Grid.two,
        right: Grid.two,
      ),
      child: SliverExpansionTileHost(
        initialExpanded: const [
          'description',
        ],
        child: CustomScrollView(
          key: const PageStorageKey<String>('Overview'),
          slivers: [
            _CourseFeatureSection(
              course: course,
            ),
            const SliverSizedBox(height: Grid.four),
            _CourseDescriptionSection(
              course: course,
            ),
            if (course.isDisplayVideo && course.videoUrl.isNotEmpty) ...[
              const SliverSizedBox(height: Grid.two),
              SliverToBoxAdapter(
                child: isOfflineMode
                    ? OfflineVideoPlayer(
                        url: course.videoUrl,
                      )
                    : MtpVideoPlayer(
                        videoUrl: course.videoUrl,
                      ),
              ),
            ],
            if (course.coverImage.large.isNotEmpty) ...[
              const SliverSizedBox(height: Grid.two),
              SliverToBoxAdapter(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: MtpImage(
                    course.coverImage.large,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
            const SliverSizedBox(height: Grid.two),
            _CourseObjectiveSection(course: course),
            const SliverSizedBox(height: Grid.one),
            _LearningOutcomeSection(course: course),
            const SliverSizedBox(height: Grid.one),
            _EvaluationSection(course: course),
            const SliverSizedBox(height: Grid.one),
            const SliverSizedBox(height: Grid.four),
          ],
        ),
      ),
    );
  }
}

class _CourseFeatureSection extends StatelessWidget {
  const _CourseFeatureSection({
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: context.l10n.courseLabelCourseFeatures),
          const SizedBox(height: Grid.two),
          Row(
            children: [
              _CourseFeatureTile(
                icon: MtpAssets.images.certificate.image(
                  width: 24,
                  height: 24,
                ),
                label: course.courseType.name,
              ),
              _CourseFeatureTile(
                icon: Text(
                  course.totalLectures.format(context.locale),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                label: context.l10n.courseLabelLectures,
              ),
              _CourseFeatureTile(
                icon: Text(
                  course.totalQuizzes.format(context.locale),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                label: context.l10n.courseLabelQuizzes,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CourseDescriptionSection extends StatelessWidget {
  const _CourseDescriptionSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverExpansionTile(

      section: 'description',
      headerBuilder: (context, section, expanded) {
        return _SliverExpansionHeader(
          title: context.l10n.courseLabelCourseDescription,
          sectionKey: section,
        );
      },
      contentBuilder: (context) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionBody(html: course.description),
            ],
          ),
        );
      },
    );
  }
}

class _CourseObjectiveSection extends StatelessWidget {
  const _CourseObjectiveSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverExpansionTile(
      section: 'objective',
      headerBuilder: (context, section, expanded) {
        return _SliverExpansionHeader(
          title: context.l10n.courseLabelCourseObjectives,
          sectionKey: section,
        );
      },
      contentBuilder: (context) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionBody(html: course.objective),
            ],
          ),
        );
      },
    );
  }
}

class _LearningOutcomeSection extends StatelessWidget {
  const _LearningOutcomeSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverExpansionTile(
      section: 'outcome',
      headerBuilder: (context, section, expanded) {
        return _SliverExpansionHeader(
          title: context.l10n.courseLabelCourseLearningOutcomes,
          sectionKey: section,
        );
      },
      contentBuilder: (context) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionBody(html: course.learningOutcome),
            ],
          ),
        );
      },
    );
  }
}

class _EvaluationSection extends StatelessWidget {
  const _EvaluationSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverExpansionTile(
      section: 'evaluation',
      headerBuilder: (context, section, expanded) {
        return _SliverExpansionHeader(
          title: context.l10n.courseLabelEvaluations,
          sectionKey: section,
        );
      },
      contentBuilder: (context) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionBody(html: course.evaluationMessage),
            ],
          ),
        );
      },
    );
  }
}

class _LiveSessionSection extends StatelessWidget {
  const _LiveSessionSection({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SliverExpansionTile(
      section: 'live_session',
      headerBuilder: (context, section, expanded) {
        return _SliverExpansionHeader(
          title: 'Live Sessions',
          sectionKey: section,
        );
      },
      contentBuilder: (context) {
        return const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionBody(html: '//TODO:'),
            ],
          ),
        );
      },
    );
  }
}

class _CourseFeatureTile extends StatelessWidget {
  const _CourseFeatureTile({
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          icon,
          const SizedBox(height: Grid.one),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverExpansionHeader extends StatelessWidget {
  const _SliverExpansionHeader({required this.title, required this.sectionKey});

  final String title;
  final String sectionKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.colorScheme.surface,
      contentPadding: EdgeInsets.zero,
      title: _SectionHeader(title: title),
      trailing: ExpansionTileChevron(
        section: sectionKey,
      ),
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
