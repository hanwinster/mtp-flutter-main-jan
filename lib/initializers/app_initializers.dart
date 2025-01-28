import 'package:base/base.dart';

class AppInitializers {
  AppInitializers({
    required this.initializers,
  });

  final Set<AppInitializer> initializers;

  Future<void> init() async {
    for (final initializer in initializers) {
      await initializer.init();
    }
  }
}
