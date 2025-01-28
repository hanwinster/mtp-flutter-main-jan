import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class OtpChannelInput extends StatelessWidget {
  const OtpChannelInput({super.key});

  void _onChanged(BuildContext context, OtpChannel channel, bool? isChecked) {
    if (isChecked != null) {
      context
          .read<RegisterBloc>()
          .add(RegisterOtpChannelChanged(channel, isChecked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.otpChannelState != current.otpChannelState ||
          previous.otpChannelError != current.otpChannelError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MtpInputFieldLabel(labelText: context.l10n.registerLabelOtpChannel),
            const SizedBox(height: Grid.half),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MtpCheckbox(
                    enabled: false,
                    labelText: context.l10n.otpChannelLabelEmail,
                    value:
                        state.otpChannelState.value[OtpChannel.email] ?? false,
                    onChanged: (isChecked) =>
                        _onChanged(context, OtpChannel.email, isChecked),
                  ),
                ),
                Expanded(
                  child: MtpCheckbox(
                    labelText: context.l10n.otpChannelLabelSms,
                    value: state.otpChannelState.value[OtpChannel.sms] ?? false,
                    onChanged: (isChecked) =>
                        _onChanged(context, OtpChannel.sms, isChecked),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: state.otpChannelError != null,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Grid.grid(2),
                  top: Grid.grid(1),
                ),
                child: MtpErrorText(
                  errorText: state.otpChannelError?.resolveErrorMessage(
                        context,
                      ) ??
                      '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
