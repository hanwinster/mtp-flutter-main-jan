import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MtpInputFieldLabel extends StatelessWidget {
  const MtpInputFieldLabel({
    super.key,
    required this.labelText,
    this.inverseTheme = false,
  });

  final String labelText;
  final bool inverseTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: context.textTheme.bodyLarge,
      //     .copyWith(
      //   fontSize: 16,
      //   fontWeight: FontWeight.w700,
      //   color: inverseTheme
      //       ? context.colorScheme.textPrimaryInverse
      //       : context.colorScheme.textPrimary,
      // ),
    );
  }
}

class MtpUnderlinedText extends StatelessWidget {
  const MtpUnderlinedText({
    super.key,
    required this.text,
    this.onPressed,
  });


  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: context.textTheme.labelLarge?.copyWith(
          decoration: TextDecoration.underline,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

}


class MtpErrorText extends StatelessWidget {
  const MtpErrorText({
    super.key,
    required this.errorText,
  });
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorText,
      style: context.textTheme.custom.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: context.colorScheme.error,
      ),
    );
  }
}
