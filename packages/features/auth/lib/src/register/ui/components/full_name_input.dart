import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class FullNameInput extends StatefulWidget {
  const FullNameInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<FullNameInput> createState() => _FullNameInputState();
}

class _FullNameInputState extends State<FullNameInput> {
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
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          previous.fullNameState != current.fullNameState,
      listener: (context, state) {
        _controller.text = state.fullNameState.value;
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) =>
            previous.fullNameState != current.fullNameState ||
            previous.fullNameError != current.fullNameError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            labelText: context.l10n.registerLabelName,
            prefixIcon: const Icon(Icons.badge_outlined),
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<RegisterBloc>().add(RegisterFullNameChanged(value));
            },
            errorText:
                state.fullNameError?.resolveFullnameErrorMessage(context),
          );
        },
      ),
    );
  }
}
