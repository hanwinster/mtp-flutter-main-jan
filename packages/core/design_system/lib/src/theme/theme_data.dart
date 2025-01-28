import 'package:assets/assets.dart';
import 'package:flutter/material.dart';

abstract class MtpThemeData {
  MtpThemeData({required this.locale});

  final Locale locale;

  ThemeData get materialThemeData;

  final ColorScheme _lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0077D4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB3D4FF),
    onPrimaryContainer: Color(0xFF002A72),
    secondary: Color(0xFFF6B024),
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFFFFE59C),
    onSecondaryContainer: Color(0xFF553500),
    tertiary: Color(0xFF6D42CE),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE0BBFF),
    onTertiaryContainer: Color(0xFF33007F),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD4),
    onErrorContainer: Color(0xFF370002),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    surfaceContainerHighest: Color(0xFFDEE7F3),
    surfaceContainerHigh: Color(0xFFE4ECF8),
    surfaceContainer: Color(0xFFCAD6E6),
    surfaceContainerLow: Color(0xFFF6F7F9),
    surfaceContainerLowest: Color(0xFFFAFBFD),
    onSurfaceVariant: Color(0xFF3E4A59),
    outline: Color(0xFF737373),
    outlineVariant: Color(0xFFB1B1B1),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF121212),
    onInverseSurface: Color(0xFFE1E1E1),
    inversePrimary: Color(0xFF83B9FF),
    surfaceTint: Color(0xFF0055D2),
  );

  final ColorScheme _darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF83B9FF),
    onPrimary: Color(0xFF002A72),
    primaryContainer: Color(0xFF003C99),
    onPrimaryContainer: Color(0xFF83B9FF),
    secondary: Color(0xFFFFDD7A),
    onSecondary: Color(0xFF553500),
    secondaryContainer: Color(0xFFFFE59C),
    onSecondaryContainer: Color(0xFF553500),
    tertiary: Color(0xFFB18FFF),
    onTertiary: Color(0xFF33007F),
    tertiaryContainer: Color(0xFFE0BBFF),
    onTertiaryContainer: Color(0xFF33007F),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD4),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE1E1E1),
    surfaceContainerHighest: Color(0xFF3E4A59),
    surfaceContainerHigh: Color(0xFF4A5969),
    surfaceContainer: Color(0xFF2A333D),
    surfaceContainerLow: Color(0xFF181818),
    surfaceContainerLowest: Color(0xFF141618),
    onSurfaceVariant: Color(0xFFCFCFCF),
    outline: Color(0xFF8F8F8F),
    outlineVariant: Color(0xFF737373),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE1E1E1),
    onInverseSurface: Color(0xFF121212),
    inversePrimary: Color(0xFF0055D2),
    surfaceTint: Color(0xFF83B9FF),
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  final TextTheme _textTheme = const TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: _bold),
    displayMedium: TextStyle(fontSize: 45, fontWeight: _bold),
    displaySmall: TextStyle(fontSize: 36, fontWeight: _bold),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: _bold),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: _semiBold),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: _semiBold),
    titleLarge: TextStyle(fontSize: 20, fontWeight: _semiBold),
    titleMedium: TextStyle(fontSize: 16, fontWeight: _semiBold),
    titleSmall: TextStyle(fontSize: 14, fontWeight: _semiBold),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: _regular),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: _regular),
    bodySmall: TextStyle(fontSize: 12, fontWeight: _regular),
    labelLarge: TextStyle(fontSize: 14, fontWeight: _semiBold),
    labelMedium: TextStyle(fontSize: 12, fontWeight: _medium),
    labelSmall: TextStyle(fontSize: 11, fontWeight: _regular),
  );

  final _primaryButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(0, 48),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );

  final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(0, 48),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );

  final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size(0, 48),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );
}

class LightMtpThemeData extends MtpThemeData {
  LightMtpThemeData({required super.locale});

  @override
  ThemeData get materialThemeData => ThemeData(
        fontFamily: MtpFontFamily.getFontFamilyByLocale(locale),
        textTheme: _textTheme,
        colorScheme: _lightColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _lightColorScheme.surface,
          foregroundColor: _lightColorScheme.onSurface,
          titleTextStyle: _textTheme.titleMedium?.copyWith(
            color: _lightColorScheme.onSurface,
          ),
        ),
        scaffoldBackgroundColor: _lightColorScheme.surface,
        outlinedButtonTheme: _outlinedButtonTheme,
        elevatedButtonTheme: _primaryButtonTheme,
        textButtonTheme: _textButtonTheme,
        useMaterial3: false,
      );
}

class DarkMtpThemeData extends MtpThemeData {
  DarkMtpThemeData({required super.locale});

  @override
  ThemeData get materialThemeData => ThemeData(
        fontFamily: MtpFontFamily.getFontFamilyByLocale(locale),
        textTheme: _textTheme,
        colorScheme: _darkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _darkColorScheme.surface,
          foregroundColor: _darkColorScheme.onSurface,
          titleTextStyle: _textTheme.titleMedium?.copyWith(
            color: _lightColorScheme.onSurface,
          ),
        ),
        scaffoldBackgroundColor: _darkColorScheme.surface,
        elevatedButtonTheme: _primaryButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        useMaterial3: false,
      );
}

extension TextThemeX on TextTheme {
  TextStyle get custom => const TextStyle();

  TextStyle? get buttonText => labelLarge;
}
