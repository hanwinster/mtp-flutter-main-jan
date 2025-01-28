import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

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
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsBloc, ContactUsState>(
      listenWhen: (previous, current) =>
          previous.organizationState != current.organizationState,
      listener: (context, state) {
        _controller.text = state.organizationState.value;
      },
      child: BlocBuilder<ContactUsBloc, ContactUsState>(
        buildWhen: (previous, current) =>
        previous.organizationState != current.organizationState ||
            previous.organizationError != current.organizationError,
        builder: (context, state) {
          return MtpOutlineTextField(
            controller: _controller,
            labelText: context.l10n.contactUsLabelOrganization,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => widget.onFieldSubmitted(),
            focusNode: widget.focusNode,
            onChanged: (value) {
              context.read<ContactUsBloc>().add(
                  ContactUsOrganizationChanged(value));
            },
            errorText: state.organizationError?.resolveErrorMessage(context),
          );
        },
      ),
    );
  }
}
