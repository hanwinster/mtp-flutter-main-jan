import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/edit_profile_bloc.dart';

class PositionInput extends StatefulWidget {
  const PositionInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<PositionInput> createState() => _PositionInputState();
}

class _PositionInputState extends State<PositionInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: context.read<EditProfileBloc>().state.positionState.value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listenWhen: (previous, current) =>
      previous.positionState != current.positionState,
      listener: (context, state) {
        _controller.text = state.positionState.value;
      },
      buildWhen: (previous, current) =>
          previous.positionState != current.positionState ||
          previous.positionError != current.positionError,
      builder: (context, state) {
        return MtpOutlineTextField(
          controller: _controller,
          labelText: context.l10n.editProfileLabelPosition,
          prefixIcon: const Icon(Icons.work_outline),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => widget.onFieldSubmitted(),
          focusNode: widget.focusNode,
          onChanged: (value) {
            context.read<EditProfileBloc>().add(EditProfilePositionChanged(value));
          },
          errorText: state.positionError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
