import 'package:flutter/material.dart';

class MtpEmpty extends StatelessWidget {
  const MtpEmpty({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
