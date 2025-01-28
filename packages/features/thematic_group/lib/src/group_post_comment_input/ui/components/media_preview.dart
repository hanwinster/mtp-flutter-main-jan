
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../bloc/bloc.dart';
import '../../bloc/post_comment_input_bloc.dart';
import '../../models/media_state.dart';

class MediaPreview extends StatelessWidget {
  const MediaPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentInputBloc, PostCommentInputState>(
      buildWhen: (previous, current) =>
          previous.mediaState != current.mediaState ||
          previous.mediaError != current.mediaError,
      builder: (context, state) {
        if (state.mediaState.value == null) {
          return const SizedBox.shrink();
        }

        final (:type, :uri) = state.mediaState.value!;
        if (uri == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(top: Grid.one),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (type == PostCommentMediaType.image)
                _ImageThumbnailView(uri: uri),
              if (type == PostCommentMediaType.video)
                _VideoThumbnailView(uri: uri),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context
                        .read<PostCommentInputBloc>()
                        .add(const PostCommentInputMediaRemoved());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ImageThumbnailView extends StatelessWidget {
  const _ImageThumbnailView({required this.uri,});
  final Uri uri;
  @override
  Widget build(BuildContext context) {
    return MtpImage.uri(
      uri,
      width: 120,
      height: 90,
    );
  }
}


class _VideoThumbnailView extends StatefulWidget {
  const _VideoThumbnailView({
    required this.uri,
  });

  final Uri uri;

  @override
  State<_VideoThumbnailView> createState() => _VideoThumbnailViewState();
}

class _VideoThumbnailViewState extends State<_VideoThumbnailView> {
  Uint8List? _thumbnail;

  @override
  void initState() {
    _processThumbnail();
    super.initState();
  }

  void _processThumbnail() async {
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: widget.uri.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );
    setState(() {
      _thumbnail = thumbnail;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_thumbnail == null) {
      return const SizedBox.shrink();
    }

    return Image.memory(_thumbnail!);
  }
}
