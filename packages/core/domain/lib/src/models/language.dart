enum Language {
  en,
  my;

  String get code {
    switch (this) {
      case Language.en:
        return 'en';
      case Language.my:
        return 'my';
    }
  }

  factory Language.fromCode(String code) {
    switch (code) {
      case 'en':
        return Language.en;
      case 'my':
        return Language.my;
      default:
        return Language.en;
    }
  }

  String get label {
    switch (this) {
      case Language.en:
        return 'EN';
      case Language.my:
        return 'မြန်မာ';
    }
  }
}