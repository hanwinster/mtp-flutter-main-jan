import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/subscription_term_bloc.dart';
import 'subscription_term_screen.dart';

class SubscriptionTermScreenEntry extends StatelessWidget {
  const SubscriptionTermScreenEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubscriptionTermBloc()..add(SubscriptionTermFetched()),
      child: SubscriptionTermScreen(),
    );
  }
}
