import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class NewPasswordInput extends StatelessWidget {
  const NewPasswordInput({
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
          previous.newPasswordState != current.newPasswordState ||
          previous.newPasswordError != current.newPasswordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          prefixIcon: const Icon(Icons.lock),
          hintText: context.l10n.changePasswordLabelNewPassword,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<ChangePasswordBloc>().add(ChangePasswordNewPasswordChanged(value));
          },
          errorText: state.newPasswordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}
