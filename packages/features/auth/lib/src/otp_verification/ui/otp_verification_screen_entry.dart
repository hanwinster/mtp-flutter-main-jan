import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/otp_verification_bloc.dart';
import 'otp_verification_screen.dart';

typedef OtpVerifiedCallback = void Function({
  required String message,
  required String credential,
  required String otp,
});

class OtpVerificationScreenEntry extends StatelessWidget {
  const OtpVerificationScreenEntry({
    super.key,
    required this.verificationContext,
    required this.credential,
    required this.onOtpVerified,
  });

  final String credential;
  final OtpVerifiedCallback onOtpVerified;
  final OtpVerificationContext verificationContext;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpVerificationBloc(
            verificationContext: verificationContext,
            credential: credential,
          ),
        ),
        BlocProvider(
          create: (context) => TimerBloc(),
        ),
      ],
      child: OtpVerificationScreen(
        onOtpVerified: onOtpVerified,
        credential: credential,
      ),
    );
  }
}
