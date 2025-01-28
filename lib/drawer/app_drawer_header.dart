import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtp/routes/app_shell_routes.dart';
import 'package:ui/ui.dart';

import '../app/bloc/app_bloc.dart';
import 'subscription_button.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({
    super.key,
    required this.state,
    required this.scaffoldKey,
  });

  final AppState state;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return _MtpDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
      ),
      child: Column(
        children: [
          state.isLoggedIn && state.loggedInUser != null
              ? _LoggedInUserHeader(
                  user: state.loggedInUser!,
                  scaffoldKey: scaffoldKey,
                )
              : _GuestUserHeader(
                  scaffoldKey: scaffoldKey,
                ),
          const SizedBox(height: Grid.one),
          SizedBox(
            width: double.infinity,
            child: SubscriptionButton(
              isLoggedIn: state.isLoggedIn,
              isSubscribed: state.loggedInUser?.isAlreadySubscribed ?? false,
            ),
          ),
        ],
      ),
    );
  }
}

class _GuestUserHeader extends StatelessWidget {
  const _GuestUserHeader({
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 56,
                color: context.colorScheme.iconDisabled,
              ),
              const SizedBox(width: Grid.one),
              Text(
                context.l10n.drawerHeaderLabelGuest,
                style: context.textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(height: Grid.one),
          _LoginButton(
            scaffoldKey: scaffoldKey,
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.isLoggedIn) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: context.l10n.drawerHeaderButtonTextLogin,
            onPressed: () {
              scaffoldKey.currentState?.closeDrawer();
              navigateToLogin(context);
            },
          ),
        );
      },
    );
  }
}

class _LoggedInUserHeader extends StatelessWidget {
  const _LoggedInUserHeader({
    required this.user,
    required this.scaffoldKey,
  });

  final User user;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          scaffoldKey.currentState!.closeDrawer();
          navigateToProfile(context);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MtpCircleImage(
                    user.profileImageUrl?.thumbnail ?? '',
                    width: 56,
                    height: 56,
                  ),
                  const SizedBox(width: Grid.one),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: Grid.one),
                      Text(
                        user.userRoleCode.getLabel(context),
                        style: context.textTheme.labelSmall,
                      ),
                      const SizedBox(height: Grid.half),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.closeDrawer();
                          navigateToProfile(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: Grid.one,
                            bottom: Grid.one,
                          ),
                          child: Text(
                            context.l10n.profileButtonTextViewProfile,
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reference: https://api.flutter.dev/flutter/material/DrawerHeader-class.html
class _MtpDrawerHeader extends StatelessWidget {
  const _MtpDrawerHeader({
    required this.child,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8.0),
  });

  final Decoration? decoration;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 16.0);
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.paddingOf(context).top;
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context),
        ),
      ),
      child: AnimatedContainer(
        decoration: decoration,
        padding: padding.add(EdgeInsets.only(top: statusBarHeight)),
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
        child: DefaultTextStyle(
          style: theme.textTheme.bodyLarge!,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: child,
          ),
        ),
      ),
    );
  }
}
