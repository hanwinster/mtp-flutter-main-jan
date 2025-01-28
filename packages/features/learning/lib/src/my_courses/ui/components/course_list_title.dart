import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/my_courses/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../../bloc/bloc.dart';

class OngoingCourseListTile extends StatelessWidget {
  const OngoingCourseListTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Course item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: context.colorScheme.surfaceContainerLowest,
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Grid.one,
              vertical: Grid.one,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Grid.one),
                    child: AspectRatio(
                      aspectRatio: defaultImageAspectRatio,
                      child: MtpImage(
                        item.coverImage.thumbnail,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Grid.two),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MtpHtmlPlainText(
                              item.title,
                              textStyle: context.textTheme.titleSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: Grid.one),
                          _buildMenu(context),
                        ],
                      ),
                      const SizedBox(height: Grid.half),
                      Text(
                        item.categories.firstOrNull?.name ?? '',
                        style: context.textTheme.labelMedium,
                      ),
                      const SizedBox(height: Grid.one),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.courseLevel.value,
                              style: context.textTheme.labelSmall,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.courseLearner == null
                                  ? ''
                                  : '${item.courseLearner!.percentage.format(
                                  context.locale)}%',
                              style: context.textTheme.labelSmall,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Grid.half),
                      LinearProgressIndicator(
                        minHeight: 2,
                        value:
                        (item.courseLearner?.percentage.toDouble() ?? 0) /
                            100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.colorScheme.primary,
                        ),
                        backgroundColor:
                        context.colorScheme.primary.withOpacity(0.1),
                      ),
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

  Widget _buildMenu(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return InkWell(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.more_vert_outlined),
        );
      },
      menuChildren: [
        MenuItemButton(
          child: Text(context.l10n.courseButtonTextCancelCourse),
          onPressed: () => _showCancelCourseDialog(context),
        ),
      ],
    );
  }

  Future<void> _showCancelCourseDialog(BuildContext context) async {
    final bloc = context.read<MyCoursesBloc>();
    await showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: CourseCancelConfirmationDialog(courseId: item.id),
        );
      },
    );
  }
}

class CompletedCourseListTile extends StatelessWidget {
  const CompletedCourseListTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.onEvaluate,
  });

  final Course item;
  final Function() onTap;
  final Function() onEvaluate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.surfaceContainerLow,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(Grid.two),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Grid.one),
                  child: AspectRatio(
                    aspectRatio: defaultImageAspectRatio,
                    child: MtpImage(

                      item.coverImage.thumbnail,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Grid.two),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MtpHtmlPlainText(
                      item.title,
                      textStyle: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Grid.one),
                    if (item.courseLearner?.isReadyToGenerateCertificate == true)
                    SizedBox(
                      width: double.infinity,
                      child: MtpOutlinedButton(
                        onPressed: () => _downloadCertificate(context, item.id),
                        labelText: context.l10n.courseButtonTextGenerateCertificate,
                        style: Theme
                            .of(context)
                            .outlinedButtonTheme
                            .style
                            ?.copyWith(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(Grid.half),
                            ),
                          ),
                          side: WidgetStatePropertyAll(
                            BorderSide(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (item.courseLearner?.isReadyToGenerateCertificate == false &&
                        item.courseLearner?.isReadyToEvaluate == true)
                      SizedBox(
                        width: double.infinity,
                        child: MtpOutlinedButton(
                          onPressed: () => onEvaluate(),
                          labelText: context.l10n.courseButtonTextStartEvaluation,
                          style: Theme
                              .of(context)
                              .outlinedButtonTheme
                              .style
                              ?.copyWith(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(Grid.half),
                              ),
                            ),
                            side: WidgetStatePropertyAll(
                              BorderSide(
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (item.courseLearner?.isReadyToGenerateCertificate == false &&
                        item.courseLearner?.isReadyToEvaluate == false)
                      SizedBox(
                        width: double.infinity,
                        child: MtpOutlinedButton(
                          onPressed: () => onTap(),
                          labelText: context.l10n.courseButtonTextContinue,
                          style: Theme
                              .of(context)
                              .outlinedButtonTheme
                              .style
                              ?.copyWith(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(Grid.half),
                              ),
                            ),
                            side: WidgetStatePropertyAll(
                              BorderSide(
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadCertificate(BuildContext context,
      String courseId,) async {
    try {
      context
          .read<CertificateDownloaderBloc>()
          .add(CertificateDownloaderDownloadRequested(courseId: courseId));
    } catch (e, s) {
      logger.e('Error downloading certificate', e, s);
    }
  }
}
