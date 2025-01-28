import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class AffiliationInput extends StatefulWidget {
  const AffiliationInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<AffiliationInput> createState() => _AffiliationInputState();
}

class _AffiliationInputState extends State<AffiliationInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: context.read<EditProfileBloc>().state.affiliationState.value,
    );
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
          previous.affiliationState != current.affiliationState,
      listener: (context, state) {
        _controller.text = state.affiliationState.value;
      },
      buildWhen: (previous, current) =>
          previous.affiliationState != current.affiliationState ||
          previous.affiliationError != current.affiliationError,
      builder: (context, state) {
        return MtpOutlineTextField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelAffiliation,
          prefixIcon: const Icon(Icons.menu_book),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => widget.onFieldSubmitted(),
          focusNode: widget.focusNode,
          onChanged: (value) {
            context.read<EditProfileBloc>().add(EditProfileAffiliationChanged(value));
          },
          errorText: state.affiliationError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
