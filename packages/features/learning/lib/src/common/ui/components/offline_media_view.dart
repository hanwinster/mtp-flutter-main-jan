import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:offline_cache/offline_cache.dart';
import 'package:ui/ui.dart';

class OfflineMediaView extends StatelessWidget {
  const OfflineMediaView({
    super.key,
    required this.media,
  });

  final double _a4AspectRatio = 1 / 1.414;
  final Media media;

  String _parseFileExtension(String url) {
    RegExp regExp = RegExp(r'\.([a-zA-Z0-9]+)(?:\?|$)');
    var match = regExp.firstMatch(url);

    if (match != null) {
      String extension = match.group(1) ?? '';
      return extension;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    switch (media.type) {
      case MediaType.video:
        return OfflineVideoPlayer(
          url: media.fileUrl,
        );
      case MediaType.image:
        return const Text('Image');
      case MediaType.pdf:
        return AspectRatio(
          aspectRatio: 1 / 1.414,
          child: OfflinePdfViewer(
            url: media.fileUrl,
          ),
        );
      default:
        if (_parseFileExtension(media.fileUrl) == 'docx') {
          return AspectRatio(
            aspectRatio: _a4AspectRatio,
            child: MtpWebView(
              url:
                  'https://docs.google.com/viewerng/viewer?url=${media.fileUrl}',
            ),
          );
        } else {
          return AspectRatio(
            aspectRatio: _a4AspectRatio,
            child: MtpWebView(
              url: media.fileUrl,
            ),
          );
        }
    }
  }
}

class OfflinePdfViewer extends StatefulWidget {
  const OfflinePdfViewer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<OfflinePdfViewer> createState() => _OfflinePdfViewerState();
}

class _OfflinePdfViewerState extends State<OfflinePdfViewer> {
  late Future<FileInfo?> _fileInfo;

  @override
  void initState() {
    super.initState();
    _fileInfo = OfflineCacheManager().getFileFromCache(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FileInfo?>(
      future: _fileInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return MtpPdfViewer(source: PdfFile(snapshot.data!.file.path));
          } else {
            return MtpPdfViewer(source: PdfUrl(widget.url));
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class OfflineVideoPlayer extends StatefulWidget {
  const OfflineVideoPlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<OfflineVideoPlayer> createState() => _OfflineVideoPlayerState();
}

class _OfflineVideoPlayerState extends State<OfflineVideoPlayer> {
  late Future<FileInfo?> _fileInfo;

  @override
  void initState() {
    super.initState();
    _fileInfo = OfflineCacheManager().getFileFromCache(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FileInfo?>(
      future: _fileInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return MtpVideoPlayer(videoUrl: snapshot.data!.file.path);
          } else {
            return MtpVideoPlayer(videoUrl: widget.url);
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
