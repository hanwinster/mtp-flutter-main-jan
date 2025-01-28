import 'package:domain/domain.dart';
import 'package:e_library/src/e_library_details/ui/e_library_details_screen.dart';
import 'package:flutter/material.dart';


class ELibraryDetailsScreenEntry extends StatelessWidget {
  const ELibraryDetailsScreenEntry({super.key, required this.resource});

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return ELibraryDetailsScreen(resource: resource,);
  }
}
