part of '../app_shell_routes.dart';

const String helpPath = '/help';

@TypedGoRoute<HelpRoute>(
  path: helpPath,
  routes: <TypedGoRoute>[
    TypedGoRoute<CmsRoute>(path: 'cms'),
    TypedGoRoute<FAQRoute>(path: 'faq'),
    TypedGoRoute<UserManualRoute>(path: 'user-manual'),
    TypedGoRoute<ContactUsRoute>(path: 'contact-us'),
  ],
)
class HelpRoute extends GoRouteData {
  const HelpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HelpScreenEntry(
      onCmsMenuTapped: ({
        required String title,
        required String url,
      }) =>
          navigateToCms(context, title: title, url: url),
      onUserManualTapped: () => navigateToUserManual(context),
      onContactUsTapped: () => navigateToContactUs(context),
      onFaqTapped: () => navigateToFAQ(context),
    );
  }
}

class FAQRoute extends GoRouteData {
  const FAQRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FaqScreenEntry();
  }
}

class UserManualRoute extends GoRouteData {
  const UserManualRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserManualScreenEntry();
  }
}

class CmsRoute extends GoRouteData {
  const CmsRoute({
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CmsScreenEntry(
      title: title,
      url: url,
    );
  }
}

class ContactUsRoute extends GoRouteData {
  const ContactUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ContactUsScreenEntry();
  }
}

void navigateToHelp(BuildContext context) {
  const HelpRoute().push(context);
}

void navigateToCms(
  BuildContext context, {
  required String title,
  required String url,
}) {
  CmsRoute(
    title: title,
    url: url,
  ).push(context);
}

void navigateToFAQ(BuildContext context) {
  const FAQRoute().push(context);
}

void navigateToUserManual(BuildContext context) {
  const UserManualRoute().push(context);
}

void navigateToContactUs(BuildContext context) {
  const ContactUsRoute().push(context);
}
