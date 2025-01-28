import 'package:flutter/material.dart';

class InheritedRouteLocation extends InheritedWidget {
  final ValueNotifier<String> currentLocation;

  const InheritedRouteLocation({
    super.key,
    required super.child,
    required this.currentLocation,
  });

  @override
  bool updateShouldNotify(covariant InheritedRouteLocation oldWidget) {
    return oldWidget.currentLocation != currentLocation;
  }

  static InheritedRouteLocation of(BuildContext context) {
    final InheritedRouteLocation? result =
        context.dependOnInheritedWidgetOfExactType<InheritedRouteLocation>();
    assert(result != null, 'No RouteNotifierInheritedWidget found in context');
    return result!;
  }

  static InheritedRouteLocation? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedRouteLocation>();
  }
}

extension InheritedLocaleExt on BuildContext {
  ValueNotifier<String> get currentLocation => InheritedRouteLocation.of(this).currentLocation;
}
