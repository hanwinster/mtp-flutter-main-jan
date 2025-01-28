import 'dart:io';
import 'dart:typed_data';

import 'package:base/base.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';
import 'package:transparent_image/transparent_image.dart' as transparent_image;

final Uint8List transparentImage = transparent_image.kTransparentImage;

class MtpCircleImage extends StatelessWidget {
  const MtpCircleImage(
    this.imageUrl, {
    super.key,
    required this.width,
    required this.height,
    this.borderWidth = 0,
    this.padding = 0,
    this.borderColor = Colors.transparent,
    this.backgroundColor,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double borderWidth;
  final double padding;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return CircleAvatar(
        radius: width / 2,
        backgroundColor:
            backgroundColor ?? context.colorScheme.surfaceContainerHighest,
      );
    }

    if (imageUrl.endsWith('.svg')) {
      return CircleAvatar(
        radius: width / 2,
        backgroundImage: Svg(
          imageUrl,
          source: SvgSource.network,
        ),
        backgroundColor:
            backgroundColor ?? context.colorScheme.surfaceContainerHighest,
      );
    } else {
      return CircleAvatar(
        radius: width / 2,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor:
            backgroundColor ?? context.colorScheme.surfaceContainerHighest,
      );
    }
  }
}

class MtpImage extends StatelessWidget {
  const MtpImage(
    this.imageUrl, {
    super.key,
    this.placeholder,
    this.showMessage = false,
    BoxFit? fit,
    double? width,
    double? height,
    String? semanticsLabel,
  })  : _fit = fit ?? BoxFit.cover,
        _width = width ?? double.infinity,
        _height = height ?? double.infinity,
        _semanticsLabel = semanticsLabel;
  final String imageUrl;
  final Widget? placeholder;
  final BoxFit _fit;
  final double _width;
  final double _height;
  final String? _semanticsLabel;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return placeholder ??
          MtpRectanglePlaceholder(
            width: _width,
            height: _height,
            message: context.l10n.errorNoImage,
            showMessage: showMessage,
          );
    }

    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {return MtpNetworkImage(
        imageUrl,
        placeholder: placeholder,
        fit: _fit,
        width: _width,
        height: _height,
        showMessage: showMessage,
        semanticsLabel: _semanticsLabel,
      );
    } else {
      return Image.file(
        File(imageUrl),
        fit: _fit,
        width: _width,
        height: _height,
      );
    }
  }

  factory MtpImage.uri(
    Uri uri, {
    BoxFit? fit,
    double? width,
    double? height,
    bool? showMessage,
  }) {
    logger.d('uri: $uri');
    final isWebUrl = uri.scheme == 'http' || uri.scheme == 'https';
    return MtpImage(
      isWebUrl ? uri.toString() : Uri.decodeFull(uri.path),
      fit: fit,
      width: width,
      height: height,
      showMessage: showMessage ?? true,
    );
  }
}

class MtpNetworkImage extends StatelessWidget {
  const MtpNetworkImage(
    this.imageUrl, {
    super.key,
    this.placeholder,
    required this.fit,
    required this.width,
    required this.height,
    required this.showMessage,
    String? semanticsLabel,
  }) : _semanticsLabel = semanticsLabel;
  final String imageUrl;
  final Widget? placeholder;
  final BoxFit fit;
  final double width;
  final double height;
  final String? _semanticsLabel;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        width: width,
        fit: fit,
        height: height,
        semanticsLabel: _semanticsLabel,
        placeholderBuilder: (BuildContext context) =>
            placeholder ??
            MtpRectanglePlaceholder(
              width: width,
              height: height,
            ),
      );
    } else {
      return CachedNetworkImage(
        placeholder: (context, url) =>
            placeholder ??
            MtpRectanglePlaceholder(
              width: width,
              height: height,
            ),
        imageUrl: imageUrl,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) => FadeInImage(
          placeholder: MemoryImage(transparentImage),
          image: imageProvider,
          fit: fit,
        ),
        errorWidget: (context, url, error) => MtpRectanglePlaceholder(
          width: width,
          height: height,
          message: error.toString() ?? '',
          showMessage: showMessage,
        ),
      );
    }
    //   return CachedNetworkImage(
    //     placeholder: (context, url) =>
    //         placeholder ??
    //         MtpRectanglePlaceholder(
    //           width: width,
    //           height: height,
    //         ),
    //     imageUrl: imageUrl,
    //     width: width,
    //     height: height,
    //     imageBuilder: (context, imageProvider) {
    //       logger.d('url: $imageUrl, imageProvider: $imageProvider');
    //       return Text('Err');
    //       // return FadeInImage(
    //       //   placeholder: MemoryImage(transparentImage),
    //       //   image: imageProvider,
    //       //   fit: fit,
    //       // );
    //     },
    //     errorWidget: (context, url, error) {
    //       logger.e('url: $url, error: $error');
    //       return Text('Err!');
    //       // return MtpRectanglePlaceholder(
    //       //   width: width,
    //       //   height: height,
    //       //   message: error?.toString() ?? '',
    //       //   showMessage: showMessage,
    //       // );
    //     },
    //   );
    // }
  }
}

class MtpRectanglePlaceholder extends StatelessWidget {
  const MtpRectanglePlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.message = '',
    this.showMessage = true,
  });

  final double width;
  final double height;
  final String message;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
            ),
          ),
        ),
        if (showMessage)
          Text(
            message,
            style: context.textTheme.labelSmall
                ?.copyWith(color: context.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
