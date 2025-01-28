import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class OtpChannelState
    extends FormzInput<Map<OtpChannel, bool>, FormFieldValidationError> {
  const OtpChannelState.unvalidated([super.value = const {}]) : super.pure();

  const OtpChannelState.validated([super.value = const {}]) : super.dirty();

  @override
  FormFieldValidationError? validator(Map<OtpChannel, bool> value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    if (value[OtpChannel.email] == null || value[OtpChannel.email] == false) {
      return const FormFieldValidationErrorEmpty();
    }
    return null;
  }

  factory OtpChannelState.newValue(
      OtpChannelState oldState, Map<OtpChannel, bool> newValue) {
    return oldState.shouldValidate
        ? OtpChannelState.validated(
            newValue,
          )
        : OtpChannelState.unvalidated(
            newValue,
          );
  }
}
