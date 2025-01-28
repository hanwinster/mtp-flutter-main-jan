import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MtpImageViewer extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const MtpImageViewer({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  ImageProvider _getImageProvider() {
    if (imageUrl.startsWith("data:image")) {
      final base64String = imageUrl.split(',').last;
      final imageBytes = base64Decode(base64String);
      return MemoryImage(imageBytes);
    } else {
      return CachedNetworkImageProvider(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: PhotoView(
              imageProvider: _getImageProvider(),
              minScale: PhotoViewComputedScale.contained * 1,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: Grid.two, top: Grid.two),
              child: ZoomTapAnimation(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary.withOpacity(0.56),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: context.colorScheme.onSurface,
                    size: 24,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
