import 'package:auth/src/otp_verification/otp_verification.dart';
import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/otp_verification_bloc.dart';
import 'components/components.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.onOtpVerified,
    required this.credential,
  });

  final String credential;
  final OtpVerifiedCallback onOtpVerified;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late FocusNode otpFocusNode;

  @override
  void initState() {
    otpFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus ||
          previous.otpRequestStatus != current.otpRequestStatus,
      listener: (context, state) {
        if (state.formSubmissionStatus is UiStateSuccess) {
          final message = state.formSubmissionStatus.dataOrNull?.message ?? '';
          if (message.isNotEmpty) {
            showSnackBar(context, message);
            context
                .read<OtpVerificationBloc>()
                .add(const OtpVerificationResultShown());
          }
          widget.onOtpVerified(
            message: state.formSubmissionStatus.messageOrEmpty(context),
            credential: widget.credential,
            otp: state.otpState.value,
          );
          return;
        } else if (state.formSubmissionStatus is UiStateFailure) {
          final error = state.formSubmissionStatus.messageOrEmpty(context);
          showSnackBar(context, error);
          context
              .read<OtpVerificationBloc>()
              .add(const OtpVerificationResultShown());
          return;
        }

        if (state.otpRequestStatus is UiStateSuccess) {
          final message = state.otpRequestStatus.dataOrNull?.message ?? '';
          if (message.isNotEmpty) {
            showSnackBar(context, message);
            context
                .read<OtpVerificationBloc>()
                .add(const OtpVerificationResendOtpResultShown());
          }
          return;
        } else if (state.otpRequestStatus is UiStateFailure) {
          final error = state.otpRequestStatus.messageOrEmpty(context);
          showSnackBar(context, error);
          context
              .read<OtpVerificationBloc>()
              .add(const OtpVerificationResendOtpResultShown());
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
          buildWhen: (previous, current) =>
              previous.formSubmissionStatus != current.formSubmissionStatus,
          builder: (context, state) {
            return FormContainer(
              scrollable: false,
              isInProgress: state.isFormSubmissionInProgress,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  MtpAssets.images.otpVerification.image(
                    width: 150,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.otpVerificaitonLabelTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.otpVerificaitonLabelDescription(
                      EmailValidator.validate(widget.credential)
                          ? widget.credential
                          : '',
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  OtpInput(
                    focusNode: otpFocusNode,
                    onFieldSubmitted: () {},
                  ),
                  const SizedBox(height: 32),
                  const SubmitButton(),
                  Expanded(child: Container()),
                  const DidNotReceiveCodeView(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
