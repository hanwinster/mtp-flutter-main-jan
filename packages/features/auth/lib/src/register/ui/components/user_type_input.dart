import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class UserTypeInput extends StatelessWidget {
  const UserTypeInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.userTypeState != current.userTypeState ||
          previous.userTypeError != current.userTypeError ||
          previous.userTypesUiState != current.userTypesUiState,
      builder: (context, state) {
        final selectedItem = UserTypeDropdownItemState.fromDomainOrNull(
          state.userTypeState.value,
          state.userTypeState.value?.getLabel(context) ?? '',
        );

        return MtpDropdown<UserTypeDropdownItemState>(
          selectedValue: selectedItem,
          items: state.userTypesUiState.dataOrNull?.map((userType) =>
              UserTypeDropdownItemState.fromDomain(userType, userType.getLabel(context)))
                  .toList() ??
              [],
          errorText: state.userTypeError?.resolveErrorMessage(context),
          onChanged: (value) {
            if (value == null) return;

            context
                .read<RegisterBloc>()
                .add(RegisterUserTypeChanged(value.userType));
          },
        );
      },
    );
  }
}
