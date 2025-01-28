part of '../app_shell_routes.dart';

class NotificationRoutes extends GoRouteData {
  const NotificationRoutes();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotiListScreenEntry(
      onNotiItemEvent: ({required String notiID}) {
        navigateToNotificationDetail(context, notiID);
      },
    );
  }
}

class NotificationDetailRoutes extends GoRouteData {
  const NotificationDetailRoutes({required this.notiId});

  final String notiId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotiDetailScreenEntry(
      notiId: notiId,
      onLaunchNotiEvent: ({required String clickActionLink}) {
        List<String> parts = clickActionLink.split('#');
        String route = parts.last;
        if (route.isNotEmpty) {
          context.push(route);
        }
      },
    );
  }
}

void navigateToNotificationsList(BuildContext context) {
  const NotificationRoutes().push(context);
}

void navigateToNotificationDetail(BuildContext context, String notiID) {
  NotificationDetailRoutes(notiId: notiID).push(context);
}
