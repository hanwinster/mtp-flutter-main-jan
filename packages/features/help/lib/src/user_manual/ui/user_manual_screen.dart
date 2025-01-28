import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/user_manual/ui/user_manual_content.dart';
import 'package:ui/ui.dart';

import '../bloc/user_manual_bloc.dart';

class UserManualScreen extends StatelessWidget {
  const UserManualScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.helpLabelUserManuals),
      ),
      body: BlocBuilder<UserManualBloc, UserManualState>(
        buildWhen: (previous, current) =>
        previous.userManualsUiState != current.userManualsUiState,
        builder: (context, state) {
          return state.userManualsUiState.toView(
            context,
            successViewBuilder: (manuals) {
              return UserManualContent(manuals: manuals);
            },
            onRetried: () {
              context.read<UserManualBloc>().add(const UserManualFetched());
            },
          );
        },
      ),
    );
  }
}