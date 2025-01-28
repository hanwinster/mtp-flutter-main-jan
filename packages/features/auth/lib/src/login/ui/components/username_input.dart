import 'package:auth/src/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
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
          previous.usernameOrEmailState != current.usernameOrEmailState ||
          previous.usernameOrEmailError != current.usernameOrEmailError,
      builder: (context, state) {
        return MtpOutlineTextField(
          prefixIcon: const Icon(Icons.person),
          labelText: context.l10n.loginLabelUsername,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<LoginBloc>().add(LoginUsernameOrEmailChanged(value));
          },
          errorText: state.usernameOrEmailError?.resolveErrorMessage(context),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z0-9@][a-zA-Z0-9-_.-]*'),
            ),
          ],
        );
      },
    );
  }
}
