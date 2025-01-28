import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class GroupCover extends StatelessWidget {
  const GroupCover({
    super.key,
    required this.coverImageUrl,
  });

  final ImageUrl coverImageUrl;
  final double _circleIconSize = 24;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: _CircleIconsView(
                    icon: MtpAssets.images.thematicDetailsIcon1.image(
                      width: _circleIconSize,
                      height: _circleIconSize,
                    ),
                    circleColor: const Color(0xFFE8DEF6)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 20),
            child: _CircleIconsView(
                icon: MtpAssets.images.thematicDetailsIcon2.image(
                  width: _circleIconSize,
                  height: _circleIconSize,
                ),
                circleColor: const Color(0xFFF7F9FC)),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: _CircleIconsView(
                    icon: MtpAssets.images.thematicDetailsIcon3.image(
                      width: _circleIconSize,
                      height: _circleIconSize,
                    ),
                    circleColor: const Color(0xFFFFF7E0)),
              )),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 80, top: 20),
              child: _CircleIconsView(
                  icon: MtpAssets.images.thematicDetailsIcon1.image(
                    width: _circleIconSize,
                    height: _circleIconSize,
                  ),
                  circleColor: const Color(0xFFFFEBEE)),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: _CircleIconsView(
                    icon: MtpAssets.images.thematicDetailsIcon4.image(
                      width: _circleIconSize,
                      height: _circleIconSize,
                    ),
                    circleColor: const Color(0xFFEBE6EF)),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _CircleIconsView(
                    icon: MtpAssets.images.thematicDetailsIcon5.image(
                      width: _circleIconSize,
                      height: _circleIconSize,
                    ),
                    circleColor: const Color(0xFFE8DEF6)),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MtpCircleImage(
                coverImageUrl.thumbnail,
                width: 100,
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CircleIconsView extends StatelessWidget {
  const _CircleIconsView({
    required this.circleColor,
    required this.icon,
  });

  final Widget icon;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: circleColor,
      child: icon,
    );
  }
}
