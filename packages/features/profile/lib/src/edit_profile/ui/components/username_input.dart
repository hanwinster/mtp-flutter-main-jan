import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class UsernameInput extends StatefulWidget {
  const UsernameInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.usernameState != current.usernameState,
      listener: (context, state) {
        _controller.text = state.usernameState.value;
      },
      buildWhen: (previous, current) =>
          previous.usernameState != current.usernameState ||
          previous.usernameError != current.usernameError,
      builder: (context, state) {
        return MtpOutlineTextField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelUsername,
          prefixIcon: const Icon(Icons.person_outline),
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_-]')),
          ],
          onSubmitted: (_) => widget.onFieldSubmitted(),
          focusNode: widget.focusNode,
          onChanged: (value) {
            context
                .read<EditProfileBloc>()
                .add(EditProfileUsernameChanged(value));
          },
          errorText: state.usernameError?.resolveUsernameErrorMessage(context),
        );
      },
    );
  }
}
