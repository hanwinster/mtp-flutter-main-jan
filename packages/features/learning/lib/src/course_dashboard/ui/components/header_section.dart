import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import '../../bloc/bloc.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CourseTitle(title: course.title),
        const SizedBox(height: Grid.two),
        _ProgressCard(
          course: course,
          navigationEventHandler: navigationEventHandler,
        ),
      ],
    );
  }
}

class _CourseTitle extends StatelessWidget {
  const _CourseTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CourseTitleIcon(),
        const SizedBox(width: Grid.two),
        Expanded(
          child: MtpHtmlPlainText(
            title,
            textStyle: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}

class _CourseTitleIcon extends StatelessWidget {
  const _CourseTitleIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Grid.one),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(Grid.half),
        ),
        child: Icon(
          Icons.school_outlined,
          size: 28,
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDashboardBloc, CourseDashboardState>(
      buildWhen: (previous, current) =>
          previous.courseLearnerUiState != current.courseLearnerUiState,
      builder: (context, state) {
        return state.courseLearnerUiState.toView(
          context,
          successViewBuilder: (courseLearner) {
            final progress = courseLearner.percentage;
            return Container(
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withOpacity(0.06),
                borderRadius: BorderRadius.circular(Grid.half),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Grid.two,
                vertical: Grid.two,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        context.l10n
                            .courseDashboardLabelFormattedProgress(progress),
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: Grid.one),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: _ContinueButton(
                            course: course,
                            learner: courseLearner,
                            navigationEventHandler: navigationEventHandler,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Grid.two),
                  LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor:
                        context.colorScheme.primary.withOpacity(0.12),
                    valueColor: AlwaysStoppedAnimation(
                        context.colorScheme.primary.withOpacity(0.6)),
                  ),
                  const SizedBox(height: Grid.one),
                  // No requirement to show this text at the moment
                  // Text(
                  //   context.l10n.courseDashboardLabelHalfWay,
                  //   style: context.textTheme.labelSmall?.copyWith(
                  //     color: context.colorScheme.primary,
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ContinueButton extends StatefulWidget {
  const _ContinueButton({
    required this.course,
    required this.learner,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseLearner learner;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  State<_ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<_ContinueButton> {
  late CourseNavigator _courseNavigator;

  @override
  void initState() {
    super.initState();
    _courseNavigator = CourseNavigator(
      materialKey: '',
      learner: widget.learner,
      navigationEventHandler: widget.navigationEventHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final inProgressMaterial = widget.course.inProgressMaterial;
    final inProgressMaterialTitle = inProgressMaterial?.title ?? '';
    final progress = widget.course.courseLearner?.percentage ?? 0;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 200,
      ),
      child: Card(
        color: context.colorScheme.primary,
        child: InkWell(
          onTap: () {
            if (widget.course.isXapiCourse) {
              _courseNavigator.navigateToXApiCourse(
                direction: CourseNavigationDirection.next,
              );
              return;
            }

            if (inProgressMaterial != null) {
              _courseNavigator.navigateToMaterial(
                material: inProgressMaterial,
                direction: CourseNavigationDirection.next,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Grid.two, vertical: Grid.one),
            child: Row(
              children: [
                MtpAssets.icons.arrowNarrowCircleBrokenLeft.svg(
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: Grid.one),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        progress > 0
                            ? context.l10n.courseDashboardButtonTextContinueLearning
                            : context.l10n.courseDashboardButtonTextStartLearning,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.onPrimary,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (inProgressMaterialTitle.isNotEmpty) ...[
                        const SizedBox(height: Grid.half),
                        Text(
                          parseTextFromHtml(inProgressMaterial?.title ?? ''),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.colorScheme.onPrimary.withOpacity(0.6),
                            height: 1,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
