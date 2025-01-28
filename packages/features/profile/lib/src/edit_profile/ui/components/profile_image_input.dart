import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:ui/ui.dart';

class ProfileImageInput extends StatelessWidget {
  const ProfileImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.profileImageState != current.profileImageState ||
          previous.profileImageError != current.profileImageError,
      builder: (context, state) {
        final imageUrl = state.profileImageState.value;
        return Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: MtpProfileImageInput(
                imageUrl: imageUrl,
                showRemoveButton: false,
                onImageUrlChanged: (url) {
                  context.read<EditProfileBloc>().add(EditProfileImageChanged(url));
                },
                onPickImageError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.toString()),
                    ),
                  );
                },
              ),
            ),
            if (state.profileImageError != null)
              Padding(
                padding: EdgeInsets.only(
                  left: Grid.grid(2),
                  top: Grid.grid(1),
                ),
                child: MtpErrorText(
                  errorText: state.profileImageError?.resolveErrorMessage(
                        context,
                      ) ??
                      '',
                ),
              ),
          ],
        );
      },
    );
  }
}
