import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class UsernameState extends FormzInput<String, FormFieldValidationError> {
  const UsernameState.unvalidated([super.value = '']) : super.pure();

  const UsernameState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    if (value.length < 5) return const FormFieldValidationErrorLength();

    final reg = RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$');
    if (!reg.hasMatch(value)) {
      return const FormFieldValidationErrorInvalid();
    }
    return null;
  }

  factory UsernameState.newValue(UsernameState oldState, String newValue) {
    return oldState.shouldValidate
        ? UsernameState.validated(
            newValue,
          )
        : UsernameState.unvalidated(
            newValue,
          );
  }
}
