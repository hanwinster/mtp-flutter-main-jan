import 'package:auth/src/otp_verification/bloc/otp_verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus ||
          previous.otpState != current.otpState,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: context.l10n.otpVerificationButtonTextVerify,
            onPressed: (state.isFormSubmissionInProgress || state.isNotValid)
                ? null
                : () {
                    context
                        .read<OtpVerificationBloc>()
                        .add(const OtpVerificationSubmitted());
                  },
          ),
        );
      },
    );
  }
}
