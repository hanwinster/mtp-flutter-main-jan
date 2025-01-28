import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class UserTypeDropdownItemState extends DropdownItemState {
  const UserTypeDropdownItemState({
    required this.userType,
    required String label,
  }) : super(itemLabel: label);

  final UserType userType;

  factory UserTypeDropdownItemState.fromDomain(UserType userType, String label) {
    return UserTypeDropdownItemState(userType: userType, label: label);
  }

  static UserTypeDropdownItemState? fromDomainOrNull(UserType? userType, String? label) {
    if (userType == null || label == null) {
      return null;
    }
    return UserTypeDropdownItemState.fromDomain(userType, label);
  }
}
