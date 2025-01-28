part of '../app_shell_routes.dart';

const String profilePath = '/profile';

@TypedGoRoute<ProfileRoute>(
  path: profilePath,
  routes: [
    TypedGoRoute<EditProfileRoute>(
      path: 'edit',
    ),
    TypedGoRoute<ChangePasswordRoute>(
      path: 'change-password',
      routes: [
        TypedGoRoute<ChangePasswordSuccessRoute>(
          path: 'success',
        ),
      ],
    ),
  ],
)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileScreenEntry(
      onEditProfileClicked: () {
        _navigateToEditProfile(context);
      },
      onHelpClicked: () {
        navigateToHelp(context);
      },
      onSettingsClicked: () {
        navigateToSettings(context);
      },
    );
  }
}

class EditProfileRoute extends GoRouteData {
  const EditProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EditProfileScreenEntry(
      onUserUpdated: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class ChangePasswordRoute extends GoRouteData {
  const ChangePasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangePasswordScreenEntry(
      onChangePasswordSuccess: ({required String message}) {
        ChangePasswordSuccessRoute(
          message: message,
        ).go(context);
      },
    );
  }
}

class ChangePasswordSuccessRoute extends GoRouteData {
  const ChangePasswordSuccessRoute({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangePasswordSuccessScreenEntry(
      onPositiveButtonClicked: () {
        LoginRoute(
          fromPage: HomeRoute().location,
        ).go(context);
      },
      message: message,
    );
  }
}

void navigateToProfile(BuildContext context) {
  const ProfileRoute().push(context);
}

void _navigateToEditProfile(BuildContext context) {
  const EditProfileRoute().push(context);
}
