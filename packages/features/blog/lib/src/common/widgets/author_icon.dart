import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AuthorIcon extends StatelessWidget {
  const AuthorIcon({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isNotEmpty) {
      return Material(
        elevation: 4,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
        shape: const CircleBorder(),
        child: SizedBox(
          width: 24,
          height: 24,
          child: MtpCircleImage(
            url,
            width: 24,
            height: 24,
          ),
        ),
      );
    }

    return Material(
      elevation: 4,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
      shape: const CircleBorder(),
      child: SizedBox(
        width: 24,
        height: 24,
        child: Icon(
          Icons.person_outline,
          size: 18,
          color: context.colorScheme.iconDisabled,
        ),
      ),
    );
  }
}
