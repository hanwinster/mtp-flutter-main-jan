import 'package:auth/src/forgot_password/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return FormContainer(
          isInProgress: state.isFormSubmissionInProgress,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MtpAssets.images.resetPassword.image(
                  width: 124,
                  height: 124,
                ),
                const SizedBox(height: Grid.two),
                Text(
                  context.l10n.forgotPasswordLabelTitle,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: Grid.two),
                Text(
                  context.l10n.forgotPasswordLabelHelper,
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: Grid.two),
                EmailInput(
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: () {
                    hideKeyboard();
                    context
                        .read<ForgotPasswordBloc>()
                        .add(const ForgotPasswordSubmitted());
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
