import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/src/form/form_field_validation_error.dart';

extension FormFieldValidationErrorX on FormFieldValidationError {
  String resolveErrorMessage(BuildContext context) {
    switch (this) {
      case FormFieldValidationErrorEmpty():
        return context.l10n.errorFormFieldRequired;
      case FormFieldValidationErrorInvalid():
        return context.l10n.errorFormFieldInvalid;
      case FormFieldValidationErrorLength():
        return context.l10n.errorFormFieldInvalid;
      case FormFieldValidationErrorMismatch():
        return context.l10n.errorFormFieldInvalid;
      case FormFieldValidationErrorCustom():
        return message;
    }
  }

  String resolvePasswordErrorMessage(BuildContext context) {
    if (this is FormFieldValidationErrorLength) {
      return context.l10n.errorFormFieldPasswordLength;
    } else if (this is FormFieldValidationErrorMismatch) {
      return context.l10n.errorFormFieldPasswordsDoNotMatch;
    }

    return resolveErrorMessage(context);
  }

  String resolveUsernameErrorMessage(BuildContext context) {
    if (this is FormFieldValidationErrorLength) {
      return context.l10n.registerLabelUsernameErrorLength;
    }

    return resolveErrorMessage(context);
  }

  String resolveFullnameErrorMessage(BuildContext context) {
    if (this is FormFieldValidationErrorLength) {
      return context.l10n.registerLabelNameErrorLength;
    }

    return resolveErrorMessage(context);
  }
}
