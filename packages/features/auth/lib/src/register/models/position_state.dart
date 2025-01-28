import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class PositionState extends FormzInput<String, FormFieldValidationError> {
  const PositionState.unvalidated([super.value = '']) : super.pure();

  const PositionState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory PositionState.newValue(PositionState oldState, String newValue) {
    return oldState.shouldValidate
        ? PositionState.validated(
            newValue,
          )
        : PositionState.unvalidated(
            newValue,
          );
  }
}
