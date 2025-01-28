import 'dart:ui';

class MtpFontFamily {
  MtpFontFamily._();

  static const String pyidaungsu = 'Pyidaungsu';
  static const String inter = 'Inter';

  static String getFontFamilyByLocale(Locale locale) {
    if (locale.languageCode == 'my') {
      return pyidaungsu;
    }
    return inter;
  }
}
