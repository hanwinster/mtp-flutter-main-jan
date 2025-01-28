import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

extension UserRoleCodeX on UserRoleCode {
  String getLabel(BuildContext context) {
    switch (this) {
      case UserRoleCode.admin:
        return context.l10n.userTypeLabelAdmin;
      case UserRoleCode.manager:
        return context.l10n.userTypeLabelManager;
      case UserRoleCode.teacherEducator:
        return context.l10n.userTypeLabelTeacherEducator;
      case UserRoleCode.studentTeacher:
        return context.l10n.userTypeLabelStudentTeacher;
      case UserRoleCode.journalist:
        return context.l10n.userTypeLabelJournalist;
      case UserRoleCode.independentLearner:
        return context.l10n.userTypeLabelIndependentLearner;
      case UserRoleCode.independentTeacher:
        return context.l10n.userTypeLabelIndependentTeacher;
      case UserRoleCode.guest:
        return context.l10n.userTypeLabelGuest;
      default:
        return '-';
    }
  }
}