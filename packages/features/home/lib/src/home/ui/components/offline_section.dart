import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';
import 'package:home/src/home/bloc/offline_content_bloc/offline_content_bloc.dart';
import 'package:home/src/home/ui/components/offline_feature_dialog.dart';
import 'package:ui/ui.dart';

class OfflineSection extends StatelessWidget {
  const OfflineSection({
    super.key,
    required this.onOfflineCoursesClick,
  });

  final OfflineCoursesClickCallback onOfflineCoursesClick;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: BlocProvider(
              create: (context) =>
                  OfflineContentBloc()..add(const OfflineContentFetched()),
              child: BlocBuilder<OfflineContentBloc, OfflineContentState>(
                builder: (context, state) {
                  if (state is OfflineContentLoaded) {
                    return InkWell(
                        onTap: () => showOfflineFeatureDialog(
                            context, state.offlineContent.steps),
                        child: const _OfflineManual());
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 1),
          Expanded(
            flex: 1,
            child: _OfflineCourses(
              onOfflineCoursesClick: onOfflineCoursesClick,
            ),
          ),
        ],
      ),
    );
  }

  // To show the dialog, you can call this in your main widget
  void showOfflineFeatureDialog(BuildContext context, List<StepModel> steps) {
    showDialog(
      context: context,
      builder: (context) => OfflineFeatureDialog(
        steps: steps,
      ),
    );
  }
}

class _OfflineManual extends StatelessWidget {
  const _OfflineManual();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.one,
          vertical: Grid.two,
        ),
        child: Row(
          children: [
            MtpAssets.images.offlineIllusIcon.image(
              width: 36,
              height: 36,
            ),
            const SizedBox(width: Grid.one),
            Expanded(
              child: Text(
                context.l10n.homeLabelOfflineExplanation,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            MtpAssets.images.leftArrowIcon.image(
              width: 12,
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class _OfflineCourses extends StatelessWidget {
  const _OfflineCourses({required this.onOfflineCoursesClick});

  final OfflineCoursesClickCallback onOfflineCoursesClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.primary,
      child: InkWell(
        onTap: () => onOfflineCoursesClick(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Grid.one,
            vertical: Grid.two,
          ),
          child: Row(
            children: [
              Icon(
                Icons.wifi_rounded,
                color: context.colorScheme.onPrimary,
                size: 24,
              ),
              const SizedBox(width: Grid.one),
              Expanded(
                child: Text(
                  context.l10n.homeLabelOfflineCourses,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
              MtpAssets.images.leftArrowIcon.image(
                width: 12,
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
