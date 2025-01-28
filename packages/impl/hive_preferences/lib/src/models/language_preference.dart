import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import '../hive_ids.dart';

part 'language_preference.g.dart';

@HiveType(typeId: HiveTypeId.languagePreference)
enum LanguagePreference {
  @HiveField(0)
  en,
  @HiveField(1)
  my;

  static LanguagePreference fromDomainModel(Language language) {
    switch (language) {
      case Language.en:
        return LanguagePreference.en;
      case Language.my:
        return LanguagePreference.my;
    }
  }

  Language toDomainModel() {
    switch (this) {
      case LanguagePreference.en:
        return Language.en;
      case LanguagePreference.my:
        return Language.my;
    }
  }
}
