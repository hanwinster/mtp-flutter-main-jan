import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
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
          previous.usernameState != current.usernameState ||
          previous.usernameError != current.usernameError,
      builder: (context, state) {
        return MtpOutlineTextField(
          helperText: context.l10n.registerLabelUsernameHelper,
          labelText: context.l10n.registerLabelUsername,
          prefixIcon: const Icon(Icons.person_outline),
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_-]')),
          ],
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterUsernameChanged(value));
          },
          errorText: state.usernameError?.resolveUsernameErrorMessage(context),
        );
      },
    );
  }
}

class UsernameInputExample extends StatelessWidget {
  const UsernameInputExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.l10n.registerLabelUsernameHelperExampleLabel,
        ),
        const SizedBox(width: Grid.one),
        Expanded(
          child: Text(
            context.l10n.registerLabelUsernameHelperExampleValue,
          ),
        )
      ],
    );
  }
}
