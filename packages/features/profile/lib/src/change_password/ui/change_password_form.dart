import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';
import 'components/components.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late FocusNode currentPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    currentPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FormSubmissionIndicator(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Grid.two,
                vertical: Grid.two,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Instruction(),
                  const SizedBox(height: Grid.two),
                  CurrentPasswordInput(
                    focusNode: currentPasswordFocusNode,
                    onFieldSubmitted: () {
                      newPasswordFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(height: Grid.two),
                  NewPasswordInput(
                    focusNode: newPasswordFocusNode,
                    onFieldSubmitted: () {
                      confirmPasswordFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(height: Grid.two),
                  ConfirmPasswordInput(
                    focusNode: confirmPasswordFocusNode,
                    onFieldSubmitted: () => _submit(context),
                  ),
                  const SizedBox(height: Grid.four),
                  const _SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Instruction extends StatelessWidget {
  const _Instruction();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.changePasswordLabelInstruction,
    );
  }
}

class _FormSubmissionIndicator extends StatelessWidget {
  const _FormSubmissionIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.formSubmissionUiState.isInProgress;
        if (!isInProgress) {
          return const SizedBox.shrink();
        }

        return const LinearProgressIndicator(
          minHeight: 2,
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.formSubmissionUiState.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            labelText: context.l10n.changePasswordButtonTextSubmit,
            onPressed: () => _submit(context),
          ),
        );
      },
    );
  }
}

void _submit(BuildContext context) {
  hideKeyboard();
  context.read<ChangePasswordBloc>().add(const ChangePasswordSubmitted());
}