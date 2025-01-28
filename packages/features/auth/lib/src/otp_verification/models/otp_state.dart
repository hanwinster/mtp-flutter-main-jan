import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class OtpState extends FormzInput<String, FormFieldValidationError> {
  const OtpState.unvalidated([super.value = '']) : super.pure();

  const OtpState.validated([super.value = '']) : super.dirty();

  static const int length = 6;

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();

    if (value.trim().length != length) {
      return const FormFieldValidationErrorLength();
    }

    return null;
  }

  factory OtpState.newValue(OtpState oldState, String newValue) {
    return oldState.shouldValidate
        ? OtpState.validated(
      newValue,
    )
        : OtpState.unvalidated(
      newValue,
    );
  }
}
