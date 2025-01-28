import 'package:base/base.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class UsernameOrEmailState extends FormzInput<String, FormFieldValidationError> {
  const UsernameOrEmailState.unvalidated([super.value = '']) : super.pure();

  const UsernameOrEmailState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();

    final usernameReg = RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$');
    final isValidUsername = usernameReg.hasMatch(value);

    final isValidEmail = EmailValidator.validate(value);
    if (!isValidUsername && !isValidEmail) {
      return const FormFieldValidationErrorInvalid();
    }

    return null;
  }

  factory UsernameOrEmailState.newValue(UsernameOrEmailState oldState, String newValue) {
    return oldState.shouldValidate
        ? UsernameOrEmailState.validated(
            newValue,
          )
        : UsernameOrEmailState.unvalidated(
            newValue,
          );
  }
}
