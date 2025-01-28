import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_manual_bloc.dart';
import 'user_manual_screen.dart';

class UserManualScreenEntry extends StatelessWidget {
  const UserManualScreenEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserManualBloc(
      )..add(const UserManualFetched()),
      child: const UserManualScreen(),
    );
  }
}