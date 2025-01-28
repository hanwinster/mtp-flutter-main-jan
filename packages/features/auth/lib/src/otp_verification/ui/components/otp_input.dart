import 'package:auth/src/otp_verification/bloc/otp_verification_bloc.dart';
import 'package:auth/src/otp_verification/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late TextEditingController _pinController;

  @override
  void initState() {
    _pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
      buildWhen: (previous, current) =>
          previous.otpState != current.otpState ||
          previous.otpError != current.otpError,
      builder: (context, state) {
        return MtpPinInput(
          pinController: _pinController,
          focusNode: widget.focusNode,
          length: OtpState.length,
          onChanged: (value){
            context.read<OtpVerificationBloc>().add(OtpVerificationOtpChanged(value));
          },
          errorText: state.otpError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
