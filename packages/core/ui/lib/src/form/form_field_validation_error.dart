import 'package:equatable/equatable.dart';

sealed class FormFieldValidationError extends Equatable {
  const FormFieldValidationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class FormFieldValidationErrorEmpty extends FormFieldValidationError {
  const FormFieldValidationErrorEmpty([super.message = '']);
}

final class FormFieldValidationErrorInvalid extends FormFieldValidationError {
  const FormFieldValidationErrorInvalid([super.message = '']);
}

final class FormFieldValidationErrorLength extends FormFieldValidationError {
  const FormFieldValidationErrorLength([super.message = '']);
}

final class FormFieldValidationErrorMismatch extends FormFieldValidationError {
  const FormFieldValidationErrorMismatch([super.message = '']);
}

final class FormFieldValidationErrorCustom extends FormFieldValidationError {
  const FormFieldValidationErrorCustom([super.message = '']);
}

extension StringToFomFieldValidationError on String? {
  FormFieldValidationError? toFormValidationErrorOrNull() {
    if (this == null || this?.isEmpty == true) return null;

    return FormFieldValidationErrorCustom(this ?? '');
  }
}
