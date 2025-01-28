import 'dart:collection';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:settings/src/settings/bloc/settings_bloc.dart';
import 'package:settings/src/settings/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subheading(text: context.l10n.settingsLabelChangeLanguage),
        const SizedBox(height: Grid.half),
        Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            buildWhen: (previous, current) =>
                previous.language != current.language,
            builder: (context, state) {
              return Column(
                  children: _getLocaleOptions(context)
                      .map((key, value) => MapEntry(
                          key,
                          _LanguageSettingItem(
                            locale: key,
                            displayOption: value,
                            selectedLocale: state.language == null
                                ? const Locale('en')
                                : Locale(state.language!.code),
                          )))
                      .values
                      .toList());
            },
          ),
        ),
      ],
    );
  }

  DisplayOption _getLocaleDisplayOption(BuildContext context, Locale? locale) {
    final localeCode = locale.toString();
    final localeName = LocaleNames.of(context)?.nameOf(localeCode);
    logger.d('Locale name: $localeName for $localeCode');
    if (localeName != null) {
      final localeNativeName =
          LocaleNamesLocalizationsDelegate.nativeLocaleNames[localeCode];
      return localeNativeName != null
          ? DisplayOption(localeNativeName, subtitle: localeName)
          : DisplayOption(localeName);
    }

    return DisplayOption(localeCode);
  }

  LinkedHashMap<Locale, DisplayOption> _getLocaleOptions(BuildContext context) {
    LinkedHashMap<Locale, DisplayOption> localeOptions =
        LinkedHashMap<Locale, DisplayOption>();
    var supportedLocales = List<Locale>.from(AppLocalizations.supportedLocales);
    final displayLocales = Map<Locale, DisplayOption>.fromIterable(
      supportedLocales,
      value: (dynamic locale) =>
          _getLocaleDisplayOption(context, locale as Locale?),
    ).entries.toList()
      ..sort((l1, l2) => compareAsciiUpperCase(l1.value.title, l2.value.title));

    localeOptions.addAll(LinkedHashMap.fromEntries(displayLocales));
    return localeOptions;
  }
}

class _LanguageSettingItem extends StatelessWidget {
  const _LanguageSettingItem({
    required this.locale,
    required this.selectedLocale,
    required this.displayOption,
  });

  final Locale locale;
  final Locale? selectedLocale;
  final DisplayOption displayOption;

  @override
  Widget build(BuildContext context) {
    locale.languageCode;
    return ListTile(
      title: Text(displayOption.title),
      subtitle:
          displayOption.subtitle != null ? Text(displayOption.subtitle!) : null,
      trailing: Radio<Locale>(
        fillColor:
            WidgetStateProperty.all<Color>(context.colorScheme.primary),
        value: locale,
        groupValue: selectedLocale,
        onChanged: (Locale? value) {
          if (value != null) {
            context.read<SettingsBloc>().add(
                SettingsLanguageChanged(Language.fromCode(value.languageCode)));
          }
        },
      ),
      onTap: () {
        context.read<SettingsBloc>().add(
            SettingsLanguageChanged(Language.fromCode(locale.languageCode)));
      },
    );
  }
}

class DisplayOption {
  final String title;
  final String? subtitle;

  DisplayOption(this.title, {this.subtitle});
}
