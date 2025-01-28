import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class OrganizationInput extends StatelessWidget {
  const OrganizationInput({
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
          previous.organizationState != current.organizationState ||
          previous.organizationError != current.organizationError,
      builder: (context, state) {
        return MtpOutlineTextField(
          labelText: context.l10n.registerLabelOrganization,
          prefixIcon: const Icon(Icons.business),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          focusNode: focusNode,
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterOrganizationChanged(value));
          },
          errorText: state.organizationError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
