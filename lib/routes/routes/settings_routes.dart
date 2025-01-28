part of '../app_shell_routes.dart';

const String settingsPath = '/settings';

@TypedGoRoute<SettingsRoute>(
  path: settingsPath,
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  SettingsScreenEntry(
      onLogoutClicked: () {
        _logout(context);
      },
      onDeactivateClicked: () {
        _deactivate(context);
      },
      onChangePasswordClicked: () {
        _changePassword(context);
      },
    );
  }
}

void navigateToSettings(BuildContext context) {
  const SettingsRoute().push(context);
}

void _logout(BuildContext context) {
  context.read<AppBloc>().add(const AppLogoutRequested());
  navigateToHome(context);
}

void _deactivate(BuildContext context) {
  context.read<AppBloc>().add(const AppDeactivateRequested());
  navigateToHome(context);
}

void _changePassword(BuildContext context) {
  ChangePasswordRoute().push(context);
}