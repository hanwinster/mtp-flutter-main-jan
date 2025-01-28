import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class AffiliationInput extends StatelessWidget {
  const AffiliationInput({
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
          previous.affiliationState != current.affiliationState ||
          previous.affiliationError != current.affiliationError,
      builder: (context, state) {
        return MtpOutlineTextField(
          labelText: context.l10n.registerLabelAffiliation,
          prefixIcon: const Icon(Icons.menu_book),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterAffiliationChanged(value));
          },
          errorText: state.affiliationError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
