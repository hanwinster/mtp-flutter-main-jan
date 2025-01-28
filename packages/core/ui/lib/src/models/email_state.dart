import 'package:base/base.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class EmailState extends FormzInput<String, FormFieldValidationError> {
  const EmailState.unvalidated([super.value = '']) : super.pure();

  const EmailState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();

    final isValid = EmailValidator.validate(value);
    if (!isValid) {
      return const FormFieldValidationErrorInvalid();
    }

    return null;
  }

  factory EmailState.newValue(EmailState oldState, String newValue) {
    return oldState.shouldValidate
        ? EmailState.validated(
            newValue,
          )
        : EmailState.unvalidated(
            newValue,
          );
  }
}
