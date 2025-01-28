import 'package:auth/src/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

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
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.passwordState != current.passwordState ||
          previous.passwordError != current.passwordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          prefixIcon: const Icon(Icons.lock),
          hintText: context.l10n.loginLabelPassword,
          textInputAction: TextInputAction.go,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<LoginBloc>().add(LoginPasswordChanged(value));
          },
          errorText: state.passwordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}
