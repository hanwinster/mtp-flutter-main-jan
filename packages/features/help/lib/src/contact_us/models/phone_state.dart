import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class PhoneState extends FormzInput<String, FormFieldValidationError> {
  const PhoneState.unvalidated([super.value = '']) : super.pure();

  const PhoneState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    // phone is optional
    return null;
  }

  factory PhoneState.newValue(PhoneState oldState, String newValue) {
    return oldState.shouldValidate
        ? PhoneState.validated(
            newValue,
          )
        : PhoneState.unvalidated(
            newValue,
          );
  }
}
