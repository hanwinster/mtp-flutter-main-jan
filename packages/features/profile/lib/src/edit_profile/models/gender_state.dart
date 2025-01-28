import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class GenderState extends FormzInput<Gender?, FormFieldValidationError> {
  const GenderState.unvalidated([super.value]) : super.pure();

  const GenderState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(Gender? value) {
    if (value == null) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory GenderState.newValue(GenderState oldState, Gender newValue) {
    return oldState.shouldValidate
        ? GenderState.validated(
            newValue,
          )
        : GenderState.unvalidated(
            newValue,
          );
  }
}
