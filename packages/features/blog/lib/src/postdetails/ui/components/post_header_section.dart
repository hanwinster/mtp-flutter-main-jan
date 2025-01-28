import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui/ui.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/widgets/widgets.dart';

class PostHeaderSection extends StatelessWidget {
  const PostHeaderSection({
    super.key,
    required this.post,
  });

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AuthorInfo(
          authorName: post.author?.fullName ?? '',
          authorAvatarUrl: post.author?.avatar ?? '',
        ),
        const SizedBox(height: Grid.two),
        post.isDisplayVideo
            ? _PostVideo(
                videoUrl: post.videoLink,
              )
            : _PostImage(
                imageUrl: post.imageUrl.medium,
                onTapped: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MtpImageViewer(
                        imageUrl: post.imageUrl.large,
                        heroTag: post.imageUrl.large,
                      ),
                    ),
                  );
                }),
        const SizedBox(height: Grid.one),
        _PostInfo(
          updatedAt: post.updatedAt,
          duration: post.estimatedDuration,
        )
      ],
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  const _AuthorInfo({
    required this.authorName,
    required this.authorAvatarUrl,
  });

  final String authorName;
  final String authorAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AuthorIcon(url: authorAvatarUrl),
        const SizedBox(width: Grid.one),
        Text(authorName),
      ],
    );
  }
}

class _PostVideo extends StatefulWidget {
  const _PostVideo({
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<_PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<_PostVideo> {
  String thumbnailUrl = '';

  @override
  void initState() {
    _processVideoUrl(widget.videoUrl);
    super.initState();
  }

  void _processVideoUrl(String videoUrl) async {
    if (!isYoutubeVideo(widget.videoUrl)) {
      await _fetchVideoThumbnail(videoUrl);
    } else {
      await _fetchYoutubeThumbnail(videoUrl);
    }
  }

  Future<void> _fetchVideoThumbnail(String videoUrl) async {
    final url = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 200,
      quality: 75,
    );
    setState(() {
      thumbnailUrl = url ?? "";
    });
  }

  Future<void> _fetchYoutubeThumbnail(String videoUrl) async {
    final youtubeId = YoutubePlayer.convertUrlToId(videoUrl) ?? "";
    final url = YoutubeThumbnail(youtubeId: youtubeId).standard();
    setState(() {
      thumbnailUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (thumbnailUrl.isEmpty) {
      return _PostImage(
        imageUrl: '',
        onTapped: () {},
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        _PostImage(
          imageUrl: thumbnailUrl,
          onTapped: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MtpVideoFullScreenPlayer(
                  videoUrl: widget.videoUrl,
                ),
              ),
            );
          },
        ),
        _VideoPlayButton(
          videoUrl: widget.videoUrl,
        ),
      ],
    );
  }
}

class _VideoPlayButton extends StatelessWidget {
  const _VideoPlayButton({required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MtpVideoFullScreenPlayer(videoUrl: videoUrl),
            ),
          );
        },
        child: Icon(
          Icons.play_circle_fill,
          color: context.colorScheme.onPrimary,
          size: 48,
        ),
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({
    required this.imageUrl,
    required this.onTapped,
  });

  final String imageUrl;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: ZoomTapAnimation(
        onTap: () => onTapped(),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(BorderRadiusSize.normal),
            child: MtpImage(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _PostInfo extends StatelessWidget {
  const _PostInfo({
    required this.updatedAt,
    required this.duration,
  });

  final DateTime updatedAt;
  final BlogPostDuration duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.postLabelPostedOn(updatedAt.asString(context)),
          style: context.textTheme.labelMedium,
        ),
        Text(
          context.l10n.postLabelDuration(duration.asString(context)),
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }
}
