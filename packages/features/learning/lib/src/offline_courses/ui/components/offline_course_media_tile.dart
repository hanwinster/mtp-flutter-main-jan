import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learning/src/common/common.dart';
import 'package:learning/src/offline_courses/models/ui_offline_list_item.dart';
import 'package:ui/ui.dart';

import '../offline_courses_screen_entry.dart';

class OfflineCourseMediaTile extends StatelessWidget {
  const OfflineCourseMediaTile({
    super.key,
    required this.item,
    required this.onRemoveMedia,
  });

  final UiOfflineCourseMediaItem item;
  final RemoveOfflineCourseMediaCallback onRemoveMedia;

  @override
  Widget build(BuildContext context) {
    final offlineCourseMedia = item.courseMedia;
    return Slidable(
      key: ValueKey('course_media${offlineCourseMedia.id}'),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onRemoveMedia(
              offlineCourseMediaId: offlineCourseMedia.id,
            ),
            icon: Icons.delete,
            foregroundColor: context.colorScheme.onError,
            backgroundColor: context.colorScheme.error,
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
            color: context.colorScheme.outline.withOpacity(0.12),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => _openMedia(
            context,
            url: offlineCourseMedia.url,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Grid.two,
              right: Grid.two,
              top: Grid.two,
              bottom: Grid.one,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 124,
                      child: AspectRatio(
                        aspectRatio: defaultImageAspectRatio,
                        child: MtpImage(
                          item.courseMedia.thumbnail,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: Grid.two),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MtpHtmlPlainText(
                            offlineCourseMedia.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Grid.one),
                const Divider(height: 1),
                Align(
                  alignment: Alignment.centerRight,
                  child: _ActionButton(
                    url: offlineCourseMedia.url,
                    onPressed: () {
                      _openMedia(
                        context,
                        url: offlineCourseMedia.url,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openMedia(
    BuildContext context, {
    required String url,
  }) {
    final mediaType = MediaType.fromUrl(url);
    MaterialPageRoute? route;
    if (mediaType == MediaType.video) {
      route = MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Center(
            child: OfflineVideoPlayer(
              url: url,
            ),
          ),
        ),
      );
    } else if (mediaType == MediaType.pdf) {
      route = MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: OfflinePdfViewer(
            url: url,
          ),
        ),
      );
    }
    if (route != null) {
      Navigator.of(context).push(route);
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.url,
    required this.onPressed,
  });

  final String url;
  final Function() onPressed;

  String get _label {
    final mediaType = MediaType.fromUrl(url);
    if (mediaType == MediaType.video) {
      return 'Watch';
    } else if (mediaType == MediaType.pdf) {
      return 'Read';
    } else {
      return 'Open';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MtpTextButton(
      onPressed: () => onPressed(),
      labelText: _label,
    );
  }
}
