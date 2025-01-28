import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MtpPrimaryButton extends StatelessWidget {
  const MtpPrimaryButton({
    super.key,
    this.labelText = '',
    this.label,
    this.icon,
    this.style,
    this.enabled = true,
    this.iconAlignment = IconAlignment.start,
    required this.onPressed,
  });

  final String labelText;
  final Widget? label;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final VoidCallback? onPressed;
  final bool enabled;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: enabled ? onPressed : null,
        icon: icon!,
        label: label ??
            Text(
              labelText,
              style: context.textTheme.labelLarge?.copyWith(
                color: enabled
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.textDisabled,
              ),
            ),
        iconAlignment: IconAlignment.end,
        style: style,
      );
    } else {
      return ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: style,
        child: label ??
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                color: enabled
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.textDisabled,
              ),
            ),
      );
    }
  }
}

class MtpTextButton extends StatelessWidget {
  const MtpTextButton({
    super.key,
    this.icon,
    this.labelText,
    this.label,
    this.style,
    this.enabled = true,
    this.iconAlignment = IconAlignment.start,
    required this.onPressed,
  });

  final Widget? icon;
  final IconAlignment iconAlignment;
  final String? labelText;
  final Widget? label;
  final VoidCallback? onPressed;
  final bool enabled;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton.icon(
        iconAlignment: iconAlignment,
        onPressed: enabled ? onPressed : null,
        icon: icon!,
        label: label ?? Text(labelText ?? ''),
        style: style,
      );
    } else {
      return TextButton(
        style: style,
        onPressed: enabled ? onPressed : null,
        child: label ?? Text(labelText ?? ''),
      );
    }
  }
}

class MtpNegativeTextButton extends StatelessWidget {
  const MtpNegativeTextButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.enabled = true,
  });

  final String labelText;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        disabledForegroundColor: context.colorScheme.textDisabled,
        foregroundColor: context.colorScheme.textMediumEmphasis,
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(labelText),
    );
  }
}

class MtpOutlinedButton extends StatelessWidget {
  const MtpOutlinedButton({
    super.key,
    this.labelText,
    this.label,
    this.borderSize,
    this.borderColor,
    required this.onPressed,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.style,
  });

  final Function()? onPressed;
  final String? labelText;
  final Widget? label;
  final double? borderSize;
  final Color? borderColor;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        iconAlignment: iconAlignment,
        style: style,
        icon: icon!,
        label: label ??
            Text(
              labelText ?? '',
            ),
      );
    } else {
      return OutlinedButton(
        style: style,
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: label ??
            Text(
              labelText ?? '',
              textAlign: TextAlign.center,
            ),
      );
    }
  }
}

class MtpWarningButton extends StatelessWidget {
  const MtpWarningButton({
    super.key,
    this.labelText,
    this.label,
    this.borderSize,
    this.borderColor,
    required this.onPressed,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.style,
  });

  final Function()? onPressed;
  final String? labelText;
  final Widget? label;
  final double? borderSize;
  final Color? borderColor;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        iconAlignment: iconAlignment,
        style: style,
        icon: icon!,
        label: label ??
            Text(
              labelText ?? '',
            ),
      );
    } else {
      return ElevatedButton(
        style: style,
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: label ??
            Text(
              labelText ?? '',
              textAlign: TextAlign.center,
            ),
      );
    }
  }
}

class MtpUnderlineButton extends StatelessWidget {
  const MtpUnderlineButton({
    super.key,
    this.enabled = true,
    required this.labelText,
    required this.onPressed,
  });

  final bool enabled;
  final String labelText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MtpTextButton(
      enabled: enabled,
      onPressed: () => (onPressed != null && enabled) ? onPressed!() : null,
      label: Text(
        labelText,
        style: context.textTheme.bodyMedium?.copyWith(
          color: enabled
              ? context.colorScheme.primary
              : context.colorScheme.textDisabled,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class MtpPrimarySubmitButton extends StatelessWidget {
  const MtpPrimarySubmitButton({
    super.key,
    required this.isInProgress,
    required this.labelText,
    required this.onPressed,
  });

  final bool isInProgress;
  final String labelText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MtpPrimaryButton(
      label: isInProgress ? const MtpLoading() : null,
      labelText: labelText,
      onPressed: isInProgress ? null : onPressed,
    );
  }
}

class MtpWarningSubmitButton extends StatelessWidget {
  const MtpWarningSubmitButton(
      {super.key,
      required this.isInProgress,
      required this.labelText,
      required this.onPressed,
      required this.style});

  final bool isInProgress;
  final String labelText;
  final Function()? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return MtpWarningButton(
      label: isInProgress ? const MtpLoading() : null,
      labelText: labelText,
      onPressed: isInProgress ? null : onPressed,
      style: style,
    );
  }
}

class MtpOutlinedSubmitButton extends StatelessWidget {
  const MtpOutlinedSubmitButton({
    super.key,
    required this.isInProgress,
    required this.labelText,
    required this.onPressed,
  });

  final bool isInProgress;
  final String labelText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MtpOutlinedButton(
      label: isInProgress ? const MtpLoading() : null,
      labelText: labelText,
      onPressed: isInProgress ? null : onPressed,
    );
  }
}
