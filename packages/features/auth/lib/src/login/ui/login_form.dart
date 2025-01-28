import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/common.dart';
import 'components/components.dart';

import '../bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onCreateNewUser,
    required this.onForgotPassword,
  });

  final CreateNewUserClickCallback onCreateNewUser;
  final ForgotPasswordCallback onForgotPassword;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return FormContainer(
          isInProgress: state.isFormSubmissionInProgress,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormHeader(
                    subtitle: context.l10n.loginLabelSubtitle,
                    showMemberLogin: false,
                  ),
                  UsernameInput(
                    focusNode: usernameFocusNode,
                    onFieldSubmitted: () {
                      FocusScope.of(context)
                          .requestFocus(passwordFocusNode);
                    },
                  ),
                  const SizedBox(height: Grid.two),
                  PasswordInput(
                    focusNode: passwordFocusNode,
                    onFieldSubmitted: () {
                      hideKeyboard();
                      context
                          .read<LoginBloc>()
                          .add(const LoginSubmitted());
                    },
                  ),
                  const SizedBox(height: Grid.one),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ForgotPasswordButton(
                      onTapped: widget.onForgotPassword,
                    ),
                  ),
                  const SubmitButton(),
                  const SizedBox(height: Grid.one),
                ],
              ),
              const Spacer(),
              NewAccountLabel(
                onCreateNewUser: widget.onCreateNewUser,
              ),
              const SizedBox(height: Grid.two),
            ],
          ),
        );
      },
    );
  }
}
