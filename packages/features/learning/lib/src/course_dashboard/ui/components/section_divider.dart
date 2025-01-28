import 'package:flutter/material.dart';

class SliverSectionDivider extends StatelessWidget {
  const SliverSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Divider(
        height: 1,
      ),
    );
  }
}
