import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/change_password/ui/change_password_screen_entry.dart';
import 'package:ui/ui.dart';

import '../bloc/change_password_bloc.dart';
import 'change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({
    super.key,
    required this.onChangePasswordSuccess,
  });
  final ChangePasswordSuccessCallback onChangePasswordSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      listener: (context, state) {
        if (state.formSubmissionUiState is UiStateSuccess) {
          final message = state.formSubmissionUiState.dataOrNull ?? '';
          if (message.isNotEmpty) {
            showSnackBar(context, message);
          }
          onChangePasswordSuccess(message: message);
        } else if (state.formSubmissionUiState is UiStateFailure) {
          showSnackBar(
              context, state.formSubmissionUiState.messageOrEmpty(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.changePasswordLabelTitle),
          elevation: 0,
        ),
        body: const ChangePasswordForm(),
      ),
    );
  }
}
