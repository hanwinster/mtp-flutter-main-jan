import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';

class SubscriptionScreenContent extends StatefulWidget {
  const SubscriptionScreenContent({
    super.key,
    required this.subscriptionTerm,
  });

  final SubscriptionTerm subscriptionTerm;

  @override
  State<SubscriptionScreenContent> createState() =>
      _SubscriptionScreenContentState();
}

class _SubscriptionScreenContentState extends State<SubscriptionScreenContent> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: Grid.two,
        right: Grid.two,
        bottom: Grid.two,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.subscriptionTerm.title,
            style: context.textTheme.titleLarge,
          ),
          if (widget.subscriptionTerm.intro.isNotEmpty) ...[
            const SizedBox(height: Grid.one),
            MtpHtml(
              widget.subscriptionTerm.intro,
              textStyle: context.textTheme.bodyLarge,
            ),
          ],
          if (widget.subscriptionTerm.useOfMaterials.isNotEmpty) ...[
            const SizedBox(height: Grid.one),
            MtpHtml(
              widget.subscriptionTerm.useOfMaterials,
              textStyle: context.textTheme.bodyLarge,
            ),
          ],
          if (widget.subscriptionTerm.generalDisclaimer.isNotEmpty) ...[
            const SizedBox(height: Grid.one),
            MtpHtml(
              widget.subscriptionTerm.generalDisclaimer,
              textStyle: context.textTheme.bodyLarge,
            ),
          ],
          Divider(),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: _accepted,
            title: Text(
              context.l10n.subscriptionLabelAgree,
              style: context.textTheme.bodyMedium,
            ),
            onChanged: (value) =>
                setState(
                      () {
                    if (value != null) _accepted = value;
                  },
                ),
          ),
          const SizedBox(height: Grid.two),
          _SubmitButton(enabled: _accepted),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionTermBloc, SubscriptionTermState>(
      buildWhen: (previous, current) =>
      previous.subscribeSubmissionUiState != current.subscribeSubmissionUiState,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            isInProgress: false,
            onPressed: enabled ? () {
              context.read<SubscriptionTermBloc>().add(SubscriptionTermSubscribed());
            } : null,
            labelText: context.l10n.subscriptionButtonTextContinue,
          ),
        );
      },
    );
  }
}
