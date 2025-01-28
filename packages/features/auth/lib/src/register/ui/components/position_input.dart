import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class PositionInput extends StatelessWidget {
  const PositionInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.positionState != current.positionState ||
          previous.positionError != current.positionError,
      builder: (context, state) {
        return MtpOutlineTextField(
          labelText: context.l10n.registerLabelPosition,
          prefixIcon: const Icon(Icons.work_outline),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterPositionChanged(value));
          },
          errorText: state.positionError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
