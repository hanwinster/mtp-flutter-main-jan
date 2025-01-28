import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UiUserTypeX on UserType {
  String getLabel(BuildContext context) {
    switch (this) {
      case UserType.independentLearner:
        return context.l10n.userTypeLabelIndependentLearner;
      case UserType.journalist:
        return context.l10n.userTypeLabelJournalist;
      case UserType.studentTeacher:
        return context.l10n.userTypeLabelStudentTeacher;
      case UserType.independentTeacher:
        return context.l10n.userTypeLabelIndependentTeacher;
      default:
        return '-';
    }
  }
}