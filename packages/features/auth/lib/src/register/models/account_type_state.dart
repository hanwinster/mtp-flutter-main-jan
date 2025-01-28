import 'package:domain/domain.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

class AccountTypeState extends FormzInput<AccountType?, FormFieldValidationError> {
  const AccountTypeState.unvalidated([super.value]) : super.pure();

  const AccountTypeState.validated([super.value]) : super.dirty();

  @override
  FormFieldValidationError? validator(AccountType? value) {
    if (value == null) {
      return const FormFieldValidationErrorEmpty();
    }
    return null;
  }

  factory AccountTypeState.newValue(AccountTypeState oldState, AccountType newValue) {
    return oldState.shouldValidate
        ? AccountTypeState.validated(
            newValue,
          )
        : AccountTypeState.unvalidated(
            newValue,
          );
  }
}
