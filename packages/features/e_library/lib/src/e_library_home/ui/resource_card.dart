import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui/ui.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({super.key, required this.resource, required this.onTap});

  final Resource resource;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 4,
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(Grid.one)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Grid.one),
                child: SizedBox(
                  width: 120,
                  child: AspectRatio(
                    aspectRatio: 1 / 1.5,
                    child: MtpImage(
                      resource.coverImage.medium,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    resource.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: Grid.two),
                  Text(
                    "${resource.resourceFormat} By ${resource.author}",
                    style: context.textTheme.labelSmall,
                  ),
                  const SizedBox(height: Grid.two),
                  MtpHtmlPlainText(
                    resource.description,
                    textStyle: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        resource.downloadFile.extension.toUpperCase(),
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      Text(
                        resource.downloadFile.humanReadableSize,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceCardShimmer extends StatelessWidget {
  const ResourceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.black,
              width: 130,
              height: 200,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 15,
                  width: 150,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 15,
                      width: 50,
                      color: Colors.grey[300],
                    ),
                    Container(
                      height: 15,
                      width: 50,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
