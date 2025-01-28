import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';

import '../../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../../bloc/bloc.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.course,
    required this.isLoggedIn,
    required this.onContinueEvent,
    required this.onGoToOfflineCoursesEvent,
  });

  final Course course;
  final bool isLoggedIn;
  final ContinueEventHandler onContinueEvent;
  final GoToOfflineCoursesEventHandler onGoToOfflineCoursesEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MtpHtmlPlainText(
            course.title,
            textStyle: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: Grid.two),
          Row(
            children: [
              _Count(
                leading: MtpAssets.images.enrollment.image(
                  width: 14,
                  height: 14,
                ),
                label: course.numberOfEnrollments.format(context.locale),
              ),
              const SizedBox(width: Grid.two),
              _Count(
                leading: MtpAssets.images.clock.image(
                  width: 14,
                  height: 14,
                ),
                label: course.estimatedDuration.asString(context),
              ),
              const SizedBox(width: Grid.two),
              _Count(
                leading: MtpAssets.images.view.image(
                  width: 14,
                  height: 14,
                ),
                label: course.viewCount.format(context.locale),
              ),
              const Spacer(),
              _Count(
                label: course.rating.format(context.locale),
                trailing: MtpAssets.images.star.image(
                  width: 14,
                  height: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: Grid.four),
          if (course.isCompleted) ...[
            Center(
              child: Text(
                context.l10n.courseLabelCompletedMessage,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: Grid.two),
          ],
          if (course.hasUserTakenCourse) ...[
            _ContinueCourseButton(
              onPressed: () => onContinueEvent(),
            ),
          ],
          if (!course.hasUserTakenCourse &&
              !course.isCompleted &&
              (isLoggedIn ? course.isUserCanAccessCourse : true)) ...[
            const _TakeCourseButton(),
          ],
          if (isCourseDownloadable(course)) ...[
            const SizedBox(height: Grid.one),
            _DownloadCourseButton(
              onPressed: () {
                context.read<CourseDetailBloc>().add(
                      CourseDetailDownloaded(course.id),
                    );
              },
              onGoToOfflineCoursesEvent: onGoToOfflineCoursesEvent,
            ),
          ],
          if (isResourceDownloadable(course)) ...[
            const SizedBox(height: Grid.one),
            const Align(
              alignment: Alignment.centerRight,
              child: _ResourceDownloadButton(),
            ),
          ],
        ],
      ),
    );
  }

  bool isCourseDownloadable(Course course) {
    return !course.isXapiCourse &&
        course.hasUserTakenCourse &&
        course.isUserCanAccessCourse;
  }

  bool isResourceDownloadable(Course course) {
    return course.resourceFileUrl.isNotEmpty &&
        course.hasUserTakenCourse &&
        course.isUserCanAccessCourse;
  }
}

class _Count extends StatelessWidget {
  const _Count({
    required this.label,
    this.leading,
    this.trailing,
  });

  final Widget? leading;
  final String label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: Grid.half),
        ],
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: Grid.half),
          trailing!,
        ],
      ],
    );
  }
}

class _TakeCourseButton extends StatelessWidget {
  const _TakeCourseButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      buildWhen: (previous, current) =>
          previous.enrolledUiState != current.enrolledUiState,
      builder: (context, state) {
        final isInProgress = state.enrolledUiState is UiStateInProgress;
        return _SurfaceButton(
          onPressed: state.enrolledUiState is UiStateInProgress
              ? null
              : () {
                  context.read<CourseDetailBloc>().add(
                        CourseDetailEnrolled(state.courseId),
                      );
                },
          label: isInProgress
              ? const MtpLoading(size: 48)
              : Text(
                  context.l10n.courseButtonTextTakeCourse,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
        );
      },
    );
  }
}

class _ContinueCourseButton extends StatelessWidget {
  const _ContinueCourseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _SurfaceButton(
      labelText: context.l10n.courseButtonTextContinue,
      onPressed: onPressed,
    );
  }
}

class _DownloadCourseButton extends StatelessWidget {
  const _DownloadCourseButton({
    required this.onPressed,
    required this.onGoToOfflineCoursesEvent,
  });

  final Function() onPressed;
  final GoToOfflineCoursesEventHandler onGoToOfflineCoursesEvent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      buildWhen: (previous, current) =>
          previous.courseDownloadUiState != current.courseDownloadUiState,
      builder: (context, state) {
        return state.courseDownloadUiState.toView(
          context,
          initialViewBuilder: () => _OutlineButton(
            labelText: context.l10n.courseButtonTextDownloadCourse,
            icon: Icon(
              Icons.file_download_outlined,
              color: context.colorScheme.onPrimary,
            ),
            onPressed: onPressed,
          ),
          errorViewBuilder: (_) => _OutlineButton(
            labelText: context.l10n.courseButtonTextDownloadCourse,
            icon: Icon(
              Icons.file_download_outlined,
              color: context.colorScheme.onPrimary,
            ),
            onPressed: onPressed,
          ),
          successViewBuilder: (_) => _OutlineButton(
            icon: Icon(
              Icons.download_done_outlined,
              color: context.colorScheme.onPrimary,
            ),
            label: Text(
              context.l10n.homeLabelOfflineCourses,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
            onPressed: () =>
                onGoToOfflineCoursesEvent(courseId: state.courseId),
          ),
          loadingViewBuilder: (_) => LinearProgressIndicator(
            value: null,
            backgroundColor: context.colorScheme.surface,
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colorScheme.primary.withOpacity(0.56),
            ),
            minHeight: Dimen.buttonHeight,
          ),
          showCachedData: false,
        );
      },
    );
  }
}

class _GenerateCourseButton extends StatelessWidget {
  const _GenerateCourseButton();

  @override
  Widget build(BuildContext context) {
    return _OutlineButton(
      labelText: context.l10n.courseButtonTextGenerateCertificate,
      onPressed: () {
        final courseId = context.read<CourseDetailBloc>().state.courseId;
        context.read<CertificateDownloaderBloc>().add(
              CertificateDownloaderDownloadRequested(courseId: courseId),
            );
      },
    );
  }
}

class _SurfaceButton extends StatelessWidget {
  const _SurfaceButton({
    this.label,
    this.labelText = '',
    required this.onPressed,
  });

  final Widget? label;
  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, Dimen.buttonHeight),
        backgroundColor: context.colorScheme.surface,
        foregroundColor: context.colorScheme.primary,
        disabledBackgroundColor: context.colorScheme.surface.withOpacity(0.56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onPressed,
      child: label ??
          Text(
            labelText,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({
    this.label,
    this.icon,
    this.labelText = '',
    required this.onPressed,
  });

  final Widget? label;
  final Widget? icon;
  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, Dimen.buttonHeight),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        side: BorderSide(
          color: context.colorScheme.onPrimary,
        ),
      ),
      icon: icon,
      label: label ??
          Text(
            labelText,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
    );
  }
}

class _ResourceDownloadButton extends StatelessWidget {
  const _ResourceDownloadButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseDetailBloc, CourseDetailState>(
      listenWhen: (previous, current) =>
          previous.resourceDownloadUiState != current.resourceDownloadUiState,
      listener: (context, state) {
        if (state.resourceDownloadUiState is UiStateSuccess) {
          showSnackBar(
              context, context.l10n.courseLabelDownloadResourcesSuccessfully);
        } else if (state.resourceDownloadUiState is UiStateFailure) {
          showSnackBar(
              context, state.resourceDownloadUiState.messageOrEmpty(context));
        }
      },
      child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
        buildWhen: (previous, current) =>
            previous.courseUiState != current.courseUiState ||
            previous.resourceDownloadUiState != current.resourceDownloadUiState,
        builder: (context, state) {
          final isInProgress =
              state.resourceDownloadUiState is UiStateInProgress;
          final resourceUrl =
              state.courseUiState.dataOrNull?.resourceFileUrl ?? '';
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isInProgress) ...[
                const MtpLoading(size: 48),
              ],
              MtpTextButton(
                  onPressed: isInProgress
                      ? null
                      : () {
                          if (resourceUrl.isNotEmpty) {
                            context.read<CourseDetailBloc>().add(
                                  CourseDetailResourceRequested(resourceUrl),
                                );
                          }
                        },
                  label: Text(
                    context.l10n.courseButtonTextDownloadResources,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimary.withOpacity(0.87),
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
