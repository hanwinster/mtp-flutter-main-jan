import 'package:flutter/material.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'list_tile/list_tile.dart';

const debugDrawer = kDebugMode ? DebugDrawer() : null;

class DebugDrawer extends StatelessWidget {
  const DebugDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FlavorConfig.setupDevFlavor();
    return Drawer(
      child: ListView(
        children: const [
          Header(),
          DebugGridListTile(),
          DbViewerListTitle(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('MTP'),
      subtitle: Text('Development Settings'),
    );
  }
}
