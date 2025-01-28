import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class AccountTypeDropdownItemState extends DropdownItemState {
  const AccountTypeDropdownItemState({
    required this.accountType,
    required String label,
  }) : super(itemLabel: label);

  final AccountType accountType;

  factory AccountTypeDropdownItemState.fromDomain(
      AccountType accountType, String label) {
    return AccountTypeDropdownItemState(
      accountType: accountType,
      label: label,
    );
  }

  static AccountTypeDropdownItemState? fromDomainOrNull(AccountType? accountType, String? label) {
    if (accountType == null || label == null) {
      return null;
    }
    return AccountTypeDropdownItemState.fromDomain(accountType, label);
  }
}
