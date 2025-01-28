import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MtpPinInput extends StatelessWidget {
  const MtpPinInput({
    super.key,
    this.errorText,
    required this.pinController,
    required this.focusNode,
    required this.length,
    required this.onChanged,
    this.onCompleted,
  });

  final String? errorText;
  final FocusNode focusNode;
  final TextEditingController pinController;
  final int length;
  final Function(String) onChanged;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: context.textTheme.titleLarge,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Pinput(
      length: length,
      controller: pinController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      onChanged: onChanged,
      onCompleted: onCompleted,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: 48,
        width: 48,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: borderColor),
        ),
      ),
      forceErrorState: errorText != null,
      errorText: errorText,
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
