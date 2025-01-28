import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiGenderX on Gender {
  String getLabel(BuildContext context) {
    switch (this) {
      case Gender.male:
        return context.l10n.genderLabelMale;
      case Gender.female:
        return context.l10n.genderLabelFemale;
      case Gender.other:
        return context.l10n.genderLabelOther;
      case Gender.unknown:
        return '';
    }
  }
}
