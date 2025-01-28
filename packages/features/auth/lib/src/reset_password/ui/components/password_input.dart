import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/reset_password_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.passwordState != current.passwordState ||
          previous.passwordError != current.passwordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          initialValue: state.passwordState.value,
          labelText: context.l10n.forgotPasswordLabelNewPassword,
          textInputAction: TextInputAction.next,
          prefixIcon: const Icon(Icons.lock_outline),
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<ResetPasswordBloc>().add(ResetPasswordPasswordChanged(value));
          },
          errorText: state.passwordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}
