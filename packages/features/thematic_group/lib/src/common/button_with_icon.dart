import 'info_view.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final Function() tap;
  final IconData iconData;
  final String showText;
  final Color? color;
  final FontWeight? weight;
  final double? fontsize;
  final Function()? longPress;

  const ButtonWithIcon(
      {super.key,
      required this.tap,
      required this.iconData,
      required this.showText,
      this.color,
      this.weight,
      this.fontsize,
      this.longPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      onLongPress: longPress,
      child: InfoView(
        iconData: iconData,
        iconColor: color,
        infoText: showText,
        weight: weight,
        fontsize: fontsize,
      ),
    );
  }
}
