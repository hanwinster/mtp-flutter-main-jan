import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

bool isYoutubeVideo(String videoUrl) {
  final uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return false;
  }

  return uri.host.contains("youtube");
}

class MtpVideoFullScreenPlayer extends StatefulWidget {
  const MtpVideoFullScreenPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<MtpVideoFullScreenPlayer> createState() =>
      _MtpVideoFullScreenPlayerState();
}

class _MtpVideoFullScreenPlayerState extends State<MtpVideoFullScreenPlayer> {
  late final YoutubePlayerController youtubePlayerController;
  ChewieController? chewieController;
  late VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Platform.isAndroid ? Colors.white : Colors.black,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: isYoutubeVideo(widget.videoUrl)
                        ? _YoutubePlayer(videoUrl: widget.videoUrl)
                        : _VideoPlayer(videoUrl: widget.videoUrl),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 16,
                  child: ZoomTapAnimation(
                    onTap: () async {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MtpVideoPlayer extends StatelessWidget {
  const MtpVideoPlayer({
    super.key,
    required this.videoUrl,
    this.aspectRatio,
  });

  final String videoUrl;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return isYoutubeVideo(videoUrl)
        ? _YoutubePlayer(videoUrl: videoUrl)
        : _VideoPlayer(
            videoUrl: videoUrl,
            aspectRatio: aspectRatio,
          );
  }
}

class _VideoPlayer extends StatefulWidget {
  const _VideoPlayer({
    required this.videoUrl,
    this.aspectRatio,
  });

  final String videoUrl;
  final double? aspectRatio;

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    initVideoControllers();
    super.initState();
  }

  bool get _isNetworkVideo => widget.videoUrl.startsWith('http');

  Future<void> initVideoControllers() async {
    _videoPlayerController = _isNetworkVideo
        ? VideoPlayerController.networkUrl(
            Uri.parse(widget.videoUrl),
          )
        : VideoPlayerController.file(File(widget.videoUrl));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      customControls: const CupertinoControls(
        backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
        iconColor: Color.fromARGB(255, 200, 200, 200),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      allowedScreenSleep: false,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      aspectRatio:
          widget.aspectRatio ?? _chewieController?.aspectRatio ?? 16 / 9,
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}

class _YoutubePlayer extends StatefulWidget {
  const _YoutubePlayer({required this.videoUrl});

  final String videoUrl;

  @override
  State<_YoutubePlayer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<_YoutubePlayer> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: youtubePlayerController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: context.colorScheme.secondary,
    );
  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }
}
