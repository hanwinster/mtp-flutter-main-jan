import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class FullNameState extends FormzInput<String, FormFieldValidationError> {
  const FullNameState.unvalidated([super.value = '']) : super.pure();

  const FullNameState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    if (value.length < 5) return const FormFieldValidationErrorLength();
    return null;
  }

  factory FullNameState.newValue(FullNameState oldState, String newValue) {
    return oldState.shouldValidate
        ? FullNameState.validated(
            newValue,
          )
        : FullNameState.unvalidated(
            newValue,
          );
  }
}
