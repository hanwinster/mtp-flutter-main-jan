import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class SubjectState extends FormzInput<String, FormFieldValidationError> {
  const SubjectState.unvalidated([super.value = '']) : super.pure();

  const SubjectState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) return const FormFieldValidationErrorEmpty();
    return null;
  }

  factory SubjectState.newValue(SubjectState oldState, String newValue) {
    return oldState.shouldValidate
        ? SubjectState.validated(
            newValue,
          )
        : SubjectState.unvalidated(
            newValue,
          );
  }
}
