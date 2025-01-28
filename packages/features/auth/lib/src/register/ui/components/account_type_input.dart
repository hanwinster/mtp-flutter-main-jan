import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class AccountTypeInput extends StatelessWidget {
  const AccountTypeInput({
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
          previous.accountTypeState != current.accountTypeState ||
          previous.accountTypeError != current.accountTypeError ||
          previous.accountTypesUiState != current.accountTypesUiState,
      builder: (context, state) {
        final selectedItem = AccountTypeDropdownItemState.fromDomainOrNull(
          state.accountTypeState.value,
          state.accountTypeState.value?.getLabel(context) ?? '',
        );

        return MtpDropdown<AccountTypeDropdownItemState>(
          selectedValue: selectedItem,
          items: state.accountTypesUiState.dataOrNull?.map((accountType) =>
              AccountTypeDropdownItemState.fromDomain(accountType, accountType.getLabel(context)))
                  .toList() ??
              [],
          errorText: state.accountTypeError?.resolveErrorMessage(context),
          onChanged: (value) {
            if (value == null) return;

            context
                .read<RegisterBloc>()
                .add(RegisterAccountTypeChanged(value.accountType));
          },
        );
      },
    );
  }
}
