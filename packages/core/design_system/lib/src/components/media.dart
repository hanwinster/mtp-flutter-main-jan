import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MtpMediaView extends StatelessWidget {
  const MtpMediaView({
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
        return MtpVideoPlayer(
          videoUrl: media.fileUrl,
        );
      case MediaType.image:
        return AspectRatio(
          aspectRatio: defaultImageAspectRatio,
          child: MtpImage(
             media.fileUrl,
          ),
        );
      case MediaType.pdf:
        return AspectRatio(
          aspectRatio: 1 / 1.414,
          child: MtpPdfViewer(
            source: PdfUrl(media.fileUrl),
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
