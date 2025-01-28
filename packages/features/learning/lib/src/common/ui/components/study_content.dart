import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../common.dart';

class StudyContent extends StatelessWidget {
  const StudyContent({
    super.key,
    required this.courseId,
    required this.title,
    required this.upperInteractiveFeatureGroups,
    required this.resourceUrl,
    required this.embedVideoUrl,
    required this.attachedFileUrl,
    required this.media,
    required this.description,
    required this.lowerInteractiveFeatureGroups,
    required this.isOfflineMode,
  });

  final String courseId;
  final String title;
  final List<InteractiveFeatureGroup> upperInteractiveFeatureGroups;
  final String resourceUrl;
  final String embedVideoUrl;
  final String attachedFileUrl;
  final Media? media;
  final String description;
  final List<InteractiveFeatureGroup> lowerInteractiveFeatureGroups;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: MtpHtmlPlainText(
            title,
            textStyle: context.textTheme.titleMedium,
          ),
        ),
        if (upperInteractiveFeatureGroups.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          InteractiveFeatureGroupWidget(
            groups: upperInteractiveFeatureGroups,
          ),
        ],
        if (embedVideoUrl.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: MtpVideoPlayer(
              videoUrl: embedVideoUrl,
            ),
          ),
        ],
        if (attachedFileUrl.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: isOfflineMode
                ? OfflineMediaView(
                    media: Media.fromFileUrl(attachedFileUrl),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MtpMediaView(
                        media: Media.fromFileUrl(attachedFileUrl),
                      ),
                      const SizedBox(height: Grid.one),
                      MediaDownload(
                        courseId: courseId,
                        url: attachedFileUrl,
                        title: title,
                      ),
                    ],
                  ),
          ),
        ],
        if (media != null) ...[
          const SizedBox(height: Grid.two),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: isOfflineMode
                ? OfflineMediaView(
                    media: media!,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MtpMediaView(
                        media: media!,
                      ),
                      const SizedBox(height: Grid.one),
                      MediaDownload(
                        courseId: courseId,
                        url: media!.url,
                        title: title,
                      ),
                    ],
                  ),
          ),
        ],
        if (resourceUrl.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: _ResourceSection(resourceUrl: resourceUrl),
          ),
        ],
        const SizedBox(height: Grid.two),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: MtpHtml(
            description,
            textStyle: context.textTheme.bodyLarge,
          ),
        ),
        if (lowerInteractiveFeatureGroups.isNotEmpty) ...[
          const SizedBox(height: Grid.two),
          InteractiveFeatureGroupWidget(
            groups: lowerInteractiveFeatureGroups,
          ),
        ],
      ],
    );
  }
}

class _ResourceSection extends StatelessWidget {
  const _ResourceSection({required this.resourceUrl});

  final String resourceUrl;

  @override
  Widget build(BuildContext context) {
    final html = '<a href="$resourceUrl">$resourceUrl</a>';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.courseLabelCourseResourceLink,
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: Grid.one),
        MtpHtml(
          html,
          textStyle: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
