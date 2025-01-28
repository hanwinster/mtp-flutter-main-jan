import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class NameState extends FormzInput<String, FormFieldValidationError> {
  const NameState.unvalidated([super.value = '']) : super.pure();

  const NameState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory NameState.newValue(NameState oldState, String newValue) {
    return oldState.shouldValidate
        ? NameState.validated(
            newValue,
          )
        : NameState.unvalidated(
            newValue,
          );
  }
}
