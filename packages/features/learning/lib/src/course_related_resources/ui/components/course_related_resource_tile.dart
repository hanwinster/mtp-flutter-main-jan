import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseRelatedResourceTile extends StatelessWidget {
  const CourseRelatedResourceTile({super.key, required this.item});

  final Resource item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Grid.one),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
          vertical: Grid.two,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: MtpImage(
                item.coverImage.thumbnail,
              ),
            ),
            const SizedBox(width: Grid.two),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(width: Grid.half),
                  Text(
                    item.slug,
                    maxLines: 2,
                    style: context.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Grid.one),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        if (item.url.isNotEmpty) {
                          launchUrl(Uri.parse(item.url));
                        }
                      },
                      child: Text(
                        context.l10n.courseRelatedResourceButtonTextLearnMore,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
