import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CommunityVideoItem extends StatelessWidget {
  final CommunityVideoModel videoModel;

  const CommunityVideoItem({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Grid.one),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Grid.one),
                    topRight: Radius.circular(Grid.one)),
                child: AspectRatio(
                  aspectRatio: defaultImageAspectRatio,
                  child: MtpImage(
                    videoModel.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Unesco Myanmar',
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB7B9D2)),
                ),
              ),
              const SizedBox(
                height: Grid.one,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  videoModel.title,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212121)),
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: Grid.one,
              ),
              Padding(
                padding: const EdgeInsets.only(left: Grid.one, right: Grid.one),
                child: Row(
                  children: [
                    Text(
                      '${videoModel.viewCount} ${context.l10n.communityVideoViews}',
                      style: context.textTheme.labelSmall,
                    ),
                    const Spacer(),
                    MtpAssets.icons.shareIcon.svg(
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Grid.one),
                child: Text(
                  videoModel.createdTimeAgo,
                  style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 8
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            right: 5,
            child: Stack(
              children: [
                MtpAssets.images.unescoLogo.image(
                  width: 50,
                  height: 50,
                ),
                Positioned(
                  bottom: 5,
                  right: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Grid.one),
                      color: context.colorScheme.primary,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
