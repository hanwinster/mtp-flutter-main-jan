import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'success_screen_entry.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.message,
    required this.onPositiveButtonClicked,
  });

  final String message;
  final PositiveButtonClickCallback onPositiveButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MtpAssets.images.passwordChangeSuccess.svg(
                      width: 124,
                      height: 124,
                    ),
                    const SizedBox(height: Grid.two),
                    Text(
                      context.l10n.otpVerifiedLabelTitle,
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: Grid.two),
                    Text(
                      message,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: MtpPrimaryButton(
                        labelText: context.l10n.otpVerifiedButtonTextLogin,
                        onPressed: () => onPositiveButtonClicked(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
