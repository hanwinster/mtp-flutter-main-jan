import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/help_bloc.dart';
import 'help_screen.dart';

typedef OnCmsMenuTapped = void Function({
  required String title,
  required String url,
});

typedef OnUserManualTapped = void Function();
typedef OnContactUsTapped = void Function();
typedef OnFaqTapped = void Function();

class HelpScreenEntry extends StatelessWidget {
  const HelpScreenEntry({
    super.key,
    required this.onCmsMenuTapped,
    required this.onUserManualTapped,
    required this.onContactUsTapped,
    required this.onFaqTapped,
  });

  final OnCmsMenuTapped onCmsMenuTapped;
  final OnUserManualTapped onUserManualTapped;
  final OnContactUsTapped onContactUsTapped;
  final OnFaqTapped onFaqTapped;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpBloc()..add(const HelpCmsMenusFetched()),
      child: HelpScreen(
        onCmsMenuTapped: onCmsMenuTapped,
        onUserManualTapped: onUserManualTapped,
        onContactUsTapped: onContactUsTapped,
        onFaqTapped: onFaqTapped,
      ),
    );
  }
}
