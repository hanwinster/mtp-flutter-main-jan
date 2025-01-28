import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/edit_profile/ui/edit_profile_form.dart';
import 'package:ui/ui.dart';

import '../../../profile.dart';
import '../bloc/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required this.onUserUpdated,
  });

  final UserUpdatedCallback onUserUpdated;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      listener: (context, state) {
        if (state.formSubmissionStatus is UiStateSuccess) {
          onUserUpdated();
          return;
        } else if (state.formSubmissionStatus is UiStateFailure) {
          showSnackBar(
              context, state.formSubmissionStatus.messageOrEmpty(context));
          context.read<EditProfileBloc>().add(const EditProfileErrorShown());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(context.l10n.editProfileLabelTitle),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const EditProfileForm(),
      ),
    );
  }
}
