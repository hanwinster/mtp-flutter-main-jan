import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class CurrentPasswordInput extends StatelessWidget {
  const CurrentPasswordInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.currentPasswordState != current.currentPasswordState ||
          previous.currentPasswordError != current.currentPasswordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          prefixIcon: const Icon(Icons.lock),
          hintText: context.l10n.changePasswordLabelCurrentPassword,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<ChangePasswordBloc>().add(ChangePasswordCurrentPasswordChanged(value));
          },
          errorText: state.currentPasswordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}
