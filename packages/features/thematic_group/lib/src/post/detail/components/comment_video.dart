import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui/ui.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CommentVideo extends StatefulWidget {
  const CommentVideo({super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<CommentVideo> createState() => CommentVideoState();
}

class CommentVideoState extends State<CommentVideo> {
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
      return _CommentVideoThumbnail(
        imageUrl: '',
        onTapped: () {},
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        _CommentVideoThumbnail(
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
              builder: (context) =>
                  MtpVideoFullScreenPlayer(videoUrl: videoUrl),
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

class _CommentVideoThumbnail extends StatelessWidget {
  const _CommentVideoThumbnail({
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
