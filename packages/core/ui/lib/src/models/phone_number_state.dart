import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class PhoneNumberState extends FormzInput<String, FormFieldValidationError> {
  const PhoneNumberState.unvalidated([super.value = '']) : super.pure();

  const PhoneNumberState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory PhoneNumberState.newValue(
      PhoneNumberState oldState, String newValue) {
    return oldState.shouldValidate
        ? PhoneNumberState.validated(
            newValue,
          )
        : PhoneNumberState.unvalidated(
            newValue,
          );
  }
}
