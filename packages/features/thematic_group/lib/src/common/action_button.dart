import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function() press;
  final String showText;
  final bool? isOutlined;
  final Color? btnColor;
  const ActionButton(
      {super.key,
      required this.press,
      required this.showText,
      required this.isOutlined,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return isOutlined!
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: btnColor ?? Theme.of(context).primaryColor)),
            onPressed: press,
            child: Text(showText))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: btnColor ?? Theme.of(context).primaryColor),
            onPressed: press,
            child: Text(showText));
  }
}
