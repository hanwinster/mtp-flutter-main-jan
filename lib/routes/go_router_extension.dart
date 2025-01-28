import 'package:go_router/go_router.dart';

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  void popUntil({required bool Function(GoRoute route, String? name) predicate}) {
    //TODO: Implement this
  }
}
