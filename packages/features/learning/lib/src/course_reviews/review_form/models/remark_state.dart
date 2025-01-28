import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class RemarkState extends FormzInput<String, FormFieldValidationError> {
  const RemarkState.unvalidated([super.value = '']) : super.pure();

  const RemarkState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    // remark is optional
    return null;
  }

  factory RemarkState.newValue(RemarkState oldState, String newValue) {
    return oldState.shouldValidate
        ? RemarkState.validated(
            newValue,
          )
        : RemarkState.unvalidated(
            newValue,
          );
  }
}
