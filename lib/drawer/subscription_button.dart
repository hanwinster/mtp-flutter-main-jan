import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscription/subscription.dart';
import 'package:ui/ui.dart';

import '../app/bloc/app_bloc.dart';
import '../routes/app_shell_routes.dart';

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({
    super.key,
    required this.isLoggedIn,
    required this.isSubscribed,
  });

  final bool isLoggedIn;
  final bool isSubscribed;

  @override
  Widget build(BuildContext context) {
    return isSubscribed
        ? const _UnsubscribeButton()
        : _SubscribeButton(
      isLoggedIn: isLoggedIn,
    );
  }
}

class _SubscribeButton extends StatelessWidget {
  const _SubscribeButton({required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        if (isLoggedIn) {
          await _showSubscriptionTermsDialog(context);
        } else {
          _showLoginDialog(context);
        }
      },
      label: Text(context.l10n.subscriptionButtonTextSubscribe),
      icon: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Grid.two),
          topRight: Radius.circular(Grid.two),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MtpAssets.images.loginIllustration.image(),
              SizedBox(height: Grid.one),
              Text(
                context.l10n.subscriptionDialogLoginTitle,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: Grid.one),
              Text(
                context.l10n.subscriptionDialogLoginMessage,
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: Grid.two),
              SizedBox(
                width: double.infinity,
                child: MtpPrimaryButton(
                  labelText: context.l10n.subscriptionDialogLoginButton,
                  onPressed: () {
                    Navigator.of(context).pop();
                    navigateToLogin(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showSubscriptionTermsDialog(BuildContext context) async {
    final result = await showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return SubscriptionTermScreenEntry();
      },
    );
    if (result == true && context.mounted) {
      context.read<AppBloc>().add(AppUserFetched());
    }
  }
}

class _UnsubscribeButton extends StatelessWidget {
  const _UnsubscribeButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) =>
      previous.unsubscribeSubmissionUiState !=
          current.unsubscribeSubmissionUiState,
      listener: (context, state) {
        if (state.unsubscribeSubmissionUiState.isSuccess) {
          final message = state.unsubscribeSubmissionUiState.dataOrNull ?? '';
          context.read<AppBloc>().add(AppUserFetched());
          showSnackBar(context, message);
        } else if (state.unsubscribeSubmissionUiState.isFailure) {
          showSnackBar(context, state.unsubscribeSubmissionUiState.messageOrEmpty(context));
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
        previous.unsubscribeSubmissionUiState !=
            current.unsubscribeSubmissionUiState,
        builder: (context, state) {
          final isInProgress = state.unsubscribeSubmissionUiState.isInProgress;
          return OutlinedButton.icon(
            onPressed: isInProgress
                ? null
                : () {
              context.read<AppBloc>().add(AppUnsubscribed());
            },
            label: isInProgress
                ? const MtpLoading()
                : Text(
              context.l10n.subscriptionButtonTextUnsubscribe,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
            icon: Icon(
              Icons.star,
              color: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}
