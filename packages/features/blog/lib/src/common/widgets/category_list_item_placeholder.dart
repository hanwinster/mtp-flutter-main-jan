import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CategoryListItemPlaceholder extends StatelessWidget {
  const CategoryListItemPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 24,
      child: MtpShimmer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(Grid.two),
          ),
        ),
      ),
    );
  }
}
