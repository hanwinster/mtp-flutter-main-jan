import 'package:auth/src/otp_verification/bloc/otp_verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class DidNotReceiveCodeView extends StatelessWidget {
  const DidNotReceiveCodeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listenWhen: (previous, current) =>
      previous.otpRequestStatus != current.otpRequestStatus,
      listener: (context, state) {
        if (state.otpRequestStatus.isSuccess) {
          context
              .read<TimerBloc>()
              .add(const TimerStarted(duration: otpResendDuration));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.otpVerificationLabelDidNotReceiveCode,
            style: context.textTheme.bodyMedium,
          ),
          Builder(builder: (context) {
            final otpRequestStatus = context.select(
                    (OtpVerificationBloc bloc) => bloc.state.otpRequestStatus);

            final timerState = context.select((TimerBloc bloc) => bloc.state);
            final timerInProgress = timerState is TimerRunInProgress;
            var label = context.l10n.otpVerificationButtonTextResend;
            if (timerInProgress) {
              label += ' ${timerState.duration.format(context.locale)}';
            }
            return MtpUnderlineButton(
              enabled: !otpRequestStatus.isInProgress && !timerInProgress,
              onPressed: () {
                if (otpRequestStatus.isInProgress) {
                  return;
                }
                context
                    .read<OtpVerificationBloc>()
                    .add(const OtpVerificationResendOtpRequested());
              },
              labelText: label,
            );
          }),
          Builder(builder: (context) {
            final otpRequestStatus = context.select(
                    (OtpVerificationBloc bloc) => bloc.state.otpRequestStatus);
            return otpRequestStatus.isInProgress
                ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
