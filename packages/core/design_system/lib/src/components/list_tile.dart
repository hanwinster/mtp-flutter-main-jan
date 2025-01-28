import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MtpOutlineListTile extends StatelessWidget {
  const MtpOutlineListTile({
    super.key,
    required this.titleText,
    this.subtitleText,
    this.titleStyle,
    this.subtitleStyle,
    this.leading,
    this.trailing,
    this.onTap,
    this.highlightSubtitle = false,
  });

  final String titleText;
  final String? subtitleText;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final bool highlightSubtitle;

  TextStyle _titleStyle(BuildContext context) {
    return subtitleStyle ??
        context.textTheme.custom.copyWith(
          color: context.colorScheme.textHighEmphasis,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
  }

  TextStyle _subtitleStyle(BuildContext context) {
    return titleStyle ??
        context.textTheme.custom.copyWith(
          color: context.colorScheme.textMediumEmphasis,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.outline,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiusSize.normal),
        ),
      ),
      child: ListTile(
        leading: leading,
        title: Text(
          titleText,
          style: titleStyle ??
              (highlightSubtitle
                  ? _subtitleStyle(context)
                  : _titleStyle(context)),
        ),
        subtitle: subtitleText != null
            ? Text(
                subtitleText.orEmpty(),
                style: subtitleStyle ??
                    (highlightSubtitle
                        ? _titleStyle(context)
                        : _subtitleStyle(context)),
              )
            : null,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
