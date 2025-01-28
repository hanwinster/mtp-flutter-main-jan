import 'package:auth/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class ProfileImageInput extends StatelessWidget {
  const ProfileImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
                onImageUrlChanged: (url) {
                  context.read<RegisterBloc>().add(RegisterProfileImageChanged(url));
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
