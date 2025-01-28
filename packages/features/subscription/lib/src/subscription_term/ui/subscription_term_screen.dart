import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/subscription_term_bloc.dart';
import 'subscription_screen_content.dart';

class SubscriptionTermScreen extends StatelessWidget {
  const SubscriptionTermScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionTermBloc, SubscriptionTermState>(
      listener: (context, state) {
        if (state.subscribeSubmissionUiState is UiStateSuccess) {
          final message = state.subscribeSubmissionUiState.dataOrNull ?? '';
          showSnackBar(context, message);
          Navigator.of(context).pop(true);
        } else if (state.subscribeSubmissionUiState is UiStateFailure) {
          showSnackBar(context, state.subscribeSubmissionUiState.messageOrEmpty(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: BlocBuilder<SubscriptionTermBloc, SubscriptionTermState>(
          buildWhen: (previous, current) =>
          previous.subscriptionTermUiState != current.subscriptionTermUiState,
          builder: (context, state) {
            return state.subscriptionTermUiState.toView(
              context,
              successViewBuilder: (item) {
                return SubscriptionScreenContent(
                  subscriptionTerm: item,
                );
              },
            );
          },
        ),
      ),
    );
  }
}