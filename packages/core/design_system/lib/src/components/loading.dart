import 'package:assets/assets.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class MtpLoading extends StatelessWidget {
  const MtpLoading({
    super.key,
    this.center = true,
    this.size = 56,
  });

  final bool center;
  final double size;

  @override
  Widget build(BuildContext context) {
    final loading = MtpAssets.animations.loading.image(width: size, height: size);
    return center
        ? Center(
      child: loading,
    )
        : loading;
  }
}

class MtpShimmer extends StatelessWidget {
  const MtpShimmer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.shimmerBaseColor,
      highlightColor: context.colorScheme.shimmerHighlightColor,
      child: child,
    );
  }
}
