part of '../app_shell_routes.dart';

class LibraryRoute extends GoRouteData {
  LibraryRoute();

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey(debugLabel: 'ELibraryScaffoldKey');

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ELibraryHomeScreenEntry(
      drawer: MtpAppDrawer(
        scaffoldKey: scaffoldKey,
      ),
      scaffoldKey: scaffoldKey,
      onResourceTapped: (Resource resource) {
        navigateToResourceDetails(context, resource);
      },
      onNotiClick: () {
        navigateToNotificationsList(context);
      },
    );
  }
}

class LibraryDetailsRoute extends GoRouteData {
  const LibraryDetailsRoute({
    required this.resourceId,
    this.$extra,
  });

  final Resource? $extra;
  final String resourceId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      return Container();
    }
    return ELibraryDetailsScreenEntry(
      // need to change
      resource: $extra!,
    );
  }
}

void navigateToResourceDetails(BuildContext context, Resource resource) {
  LibraryDetailsRoute($extra: resource, resourceId: resource.id).push(context);
}
