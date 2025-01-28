import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

import '../../models/models.dart';

class RegionInput extends StatelessWidget {
  const RegionInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.regionState != current.regionState ||
          previous.regionError != current.regionError ||
          previous.contactRegionsUiState != current.contactRegionsUiState,
      builder: (context, state) {
        final selectedItem = state.regionState.value != null
            ? RegionDropdownItemState.fromDomain(state.regionState.value!)
            : null;

        return MtpDropdown<RegionDropdownItemState>(
          hintText: context.l10n.contactUsLabelRegion,
          selectedValue: selectedItem,
          items: state.contactRegionsUiState.dataOrNull?.map((userType) =>
              RegionDropdownItemState.fromDomain(userType))
                  .toList() ??
              [],
          errorText: state.regionError?.resolveErrorMessage(context),
          onChanged: (value) {
            if (value == null) return;

            context
                .read<ContactUsBloc>()
                .add(ContactUsRegionChanged(value.region));
          },
        );
      },
    );
  }
}
