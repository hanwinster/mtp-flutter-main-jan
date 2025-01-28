import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class MessageState extends FormzInput<String, FormFieldValidationError> {
  const MessageState.unvalidated([super.value = '']) : super.pure();

  const MessageState.validated([super.value = '']) : super.dirty();

  @override
  FormFieldValidationError? validator(String value) {
    if (value.isEmpty) {
      return const FormFieldValidationErrorEmpty();
    }
    return null;
  }

  factory MessageState.newValue(MessageState oldState, String newValue) {
    return oldState.shouldValidate
        ? MessageState.validated(
            newValue,
          )
        : MessageState.unvalidated(
            newValue,
          );
  }
}
