import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class GenerateCertificateButton extends StatelessWidget {
  const GenerateCertificateButton({
    super.key,
    required this.isCourseCompleted,
  });

  final bool isCourseCompleted;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();

    // There are so many criteria to consider before generating a certificate
    // that it's better to disable the button for now.
    return MtpPrimaryButton(
      labelText: 'Generate Certificate',
      onPressed: isCourseCompleted ? () {} : null,
    );
  }
}
