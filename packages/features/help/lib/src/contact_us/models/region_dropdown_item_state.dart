import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class RegionDropdownItemState extends DropdownItemState {
  RegionDropdownItemState({
    required this.region,
  }) : super(itemLabel: region.name);

  final ContactRegion region;

  factory RegionDropdownItemState.fromDomain(ContactRegion region) {
    return RegionDropdownItemState(region: region);
  }
}
