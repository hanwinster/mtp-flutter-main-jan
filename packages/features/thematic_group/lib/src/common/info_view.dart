import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  final Color? iconColor;
  final IconData? iconData;
  final Widget? icon;
  final String infoText;
  final FontWeight? weight;
  final double? textwidth;
  final double? fontsize;

  const InfoView({
    super.key,
    this.iconColor,
    this.iconData,
    required this.infoText,
    this.weight,
    this.fontsize,
    this.icon,
    this.textwidth
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon ??
            Icon(
              iconData,
              color: iconColor ?? Theme.of(context).primaryColor,
              size: 17,
            ),
        const SizedBox(width: 3),
        textwidth != null ? ConstrainedBox(
          constraints: BoxConstraints(maxWidth: textwidth!),
          child: Text(
            infoText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontsize ?? 12,
              fontWeight: weight ?? FontWeight.w400,
            ),
          ),
        ):Text(
          infoText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontsize ?? 12,
            fontWeight: weight ?? FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
