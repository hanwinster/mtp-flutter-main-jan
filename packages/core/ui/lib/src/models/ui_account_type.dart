import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiAccountTypeX on AccountType {
  String getLabel(BuildContext context) {
    switch (this) {
      case AccountType.learner:
        return context.l10n.accountTypeLabelLearner;
      case AccountType.teacher:
        return context.l10n.accountTypeLabelTeacher;
      default:
        return '';
    }
  }
}