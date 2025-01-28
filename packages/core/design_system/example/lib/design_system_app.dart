import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'component_storybook.dart';

class DesignSystemApp extends StatelessWidget {
  DesignSystemApp({super.key});

  final _lightTheme = LightMtpThemeData(locale: const Locale('en'));
  final _darkTheme = DarkMtpThemeData(locale: const Locale('en'));

  @override
  Widget build(BuildContext context) {
    return MtpTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: ComponentStorybook(
        lightThemeData: _lightTheme,
        darkThemeData: _darkTheme,
      ),
    );
  }
}
