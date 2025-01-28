import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class OrganizationState extends FormzInput<String, FormFieldValidationError> {
  const OrganizationState.unvalidated([super.value = '']) : super.pure();

  const OrganizationState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    // organization name is optional
    return null;
  }

  factory OrganizationState.newValue(OrganizationState oldState, String newValue) {
    return oldState.shouldValidate
        ? OrganizationState.validated(
            newValue,
          )
        : OrganizationState.unvalidated(
            newValue,
          );
  }
}
