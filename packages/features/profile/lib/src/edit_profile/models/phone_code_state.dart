import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class PhoneCodeState extends FormzInput<String, FormFieldValidationError> {
  const PhoneCodeState.unvalidated([super.value = '']) : super.pure();

  const PhoneCodeState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    // phone code is optional
    return null;
  }

  factory PhoneCodeState.newValue(PhoneCodeState oldState, String newValue) {
    return oldState.shouldValidate
        ? PhoneCodeState.validated(
            newValue,
          )
        : PhoneCodeState.unvalidated(
            newValue,
          );
  }
}
