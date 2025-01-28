import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class PasswordState extends FormzInput<String, FormFieldValidationError> {
  const PasswordState.unvalidated([super.value = '']) : super.pure();

  const PasswordState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    if (value.length < 8) return const FormFieldValidationErrorLength();
    return null;
  }

  factory PasswordState.newValue(PasswordState oldState, String newValue) {
    return oldState.shouldValidate
        ? PasswordState.validated(
            newValue,
          )
        : PasswordState.unvalidated(
            newValue,
          );
  }
}
