import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
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
          previous.confirmPasswordState != current.confirmPasswordState ||
          previous.confirmPasswordError != current.confirmPasswordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          prefixIcon: const Icon(Icons.lock),
          hintText: context.l10n.changePasswordLabelConfirmPassword,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<ChangePasswordBloc>().add(ChangePasswordConfirmPasswordChanged(value));
          },
          errorText: state.confirmPasswordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}
