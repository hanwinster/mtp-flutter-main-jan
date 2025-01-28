import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/faq_bloc.dart';
import 'faq_screen.dart';

class FaqScreenEntry extends StatelessWidget {
  const FaqScreenEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqBloc()..add(const FaqFetched()),
      child: const FaqScreen(),
    );
  }
}
