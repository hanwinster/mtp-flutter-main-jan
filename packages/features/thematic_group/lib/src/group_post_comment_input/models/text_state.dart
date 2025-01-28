import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class TextState extends FormzInput<String, FormFieldValidationError> {
  const TextState.unvalidated([super.value = '']) : super.pure();

  const TextState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    return null;
  }

  factory TextState.newValue(TextState oldState, String newValue) {
    return oldState.shouldValidate
        ? TextState.validated(
      newValue,
    )
        : TextState.unvalidated(
      newValue,
    );
  }
}
