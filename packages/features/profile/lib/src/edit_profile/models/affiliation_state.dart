import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class AffiliationState extends FormzInput<String, FormFieldValidationError> {
  const AffiliationState.unvalidated([super.value = '']) : super.pure();

  const AffiliationState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory AffiliationState.newValue(AffiliationState oldState, String newValue) {
    return oldState.shouldValidate
        ? AffiliationState.validated(
            newValue,
          )
        : AffiliationState.unvalidated(
            newValue,
          );
  }
}
