import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/common.dart';
import '../bloc/reset_password_bloc.dart';
import 'components/components.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return FormContainer(
          isInProgress: state.isFormSubmissionInProgress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FormHeader(
                subtitle: '',
                showMemberLogin: false,
              ),
              const SizedBox(height: Grid.two),
              PasswordInput(
                focusNode: _passwordFocusNode,
                onFieldSubmitted: () {
                  _confirmPasswordFocusNode.requestFocus();
                },
              ),
              const SizedBox(height: Grid.two),
              ConfirmPasswordInput(
                focusNode: _confirmPasswordFocusNode,
                onFieldSubmitted: () {
                  hideKeyboard();
                  context
                      .read<ResetPasswordBloc>()
                      .add(const ResetPasswordSubmitted());
                },
              ),
              const SizedBox(height: Grid.four),
              const SubmitButton(),
            ],
          ),
        );
      },
    );
  }
}
