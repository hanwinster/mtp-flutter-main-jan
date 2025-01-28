import 'package:flutter/material.dart';

import '../../ui.dart';

class RectanglePlaceholder extends StatelessWidget {
  const RectanglePlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  final double width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const CustomColor(0xFFD8D8D8), // w
        borderRadius: borderRadius,
      ),
    );
  }
}

class ShapePlaceholder extends StatelessWidget {
  const ShapePlaceholder({
    super.key,
    required this.width,
    required this.height,
    required this.shape,
  });

  final double width;
  final double height;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const CustomColor(0xFFD8D8D8), // w
        shape: shape,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class TextPlaceholder extends StatelessWidget {
  const TextPlaceholder({
    super.key,
    this.line = 1,
    this.width,
    this.height,
  });

  final int line;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < line; i++) ...[
          if (i > 0) const SizedBox(height: Grid.one),
          Container(
            width: width ?? (i == 0 ? double.infinity : 100),
            height: height ?? 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Grid.one),
            ),
          ),
        ]
      ],
    );
  }
}
