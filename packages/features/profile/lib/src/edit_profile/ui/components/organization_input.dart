import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class OrganizationInput extends StatefulWidget {
  const OrganizationInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<OrganizationInput> createState() => _OrganizationInputState();
}

class _OrganizationInputState extends State<OrganizationInput> {
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
      previous.organizationState != current.organizationState,
      listener: (context, state) {
        _controller.text = state.organizationState.value;
      },
      buildWhen: (previous, current) =>
          previous.organizationState != current.organizationState ||
          previous.organizationError != current.organizationError,
      builder: (context, state) {
        return MtpOutlineTextField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelOrganization,
          prefixIcon: const Icon(Icons.business),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => widget.onFieldSubmitted(),
          focusNode: widget.focusNode,
          onChanged: (value) {
            context.read<EditProfileBloc>().add(EditProfileOrganizationChanged(value));
          },
          errorText: state.organizationError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
