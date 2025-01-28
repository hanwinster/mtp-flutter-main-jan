import 'package:design_system/src/theme/theme_data.dart';
import 'package:flutter/material.dart';

export 'colors.dart';
export 'dimens.dart';
export 'theme_data.dart';

extension ContextExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  MtpThemeData get theme => MtpTheme.of(this);
}

class MtpTheme extends InheritedWidget {
  const MtpTheme({
    required super.child,
    required this.lightTheme,
    required this.darkTheme,
    super.key,
  });

  final MtpThemeData lightTheme;
  final MtpThemeData darkTheme;

  @override
  bool updateShouldNotify(
    MtpTheme oldWidget,
  ) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static MtpThemeData of(BuildContext context) {
    final MtpTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<MtpTheme>();
    assert(inheritedTheme != null, 'No MtpTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? inheritedTheme!.darkTheme
        : inheritedTheme!.lightTheme;
  }
}
