import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class OtpChannelState
    extends FormzInput<OtpChannel, FormFieldValidationError> {
  const OtpChannelState.unvalidated(super.value) : super.pure();

  const OtpChannelState.validated(super.value) : super.dirty();

  @override
  FormFieldValidationError? validator(OtpChannel value) {
    return null;
  }

  factory OtpChannelState.newValue(
      OtpChannelState oldState, OtpChannel newValue) {
    return oldState.shouldValidate
        ? OtpChannelState.validated(
            newValue,
          )
        : OtpChannelState.unvalidated(
            newValue,
          );
  }
}
