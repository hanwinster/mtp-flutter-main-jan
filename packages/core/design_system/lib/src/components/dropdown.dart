import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class MtpDropdown<T extends DropdownItemState> extends StatefulWidget {
  const MtpDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    this.labelText,
    required this.onChanged,
    this.hintText,
    this.errorText,
  });

  final T? selectedValue;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final List<T> items;
  final Function(T?) onChanged;

  @override
  State<MtpDropdown<T>> createState() => _MtpDropdownState<T>();
}

class _MtpDropdownState<T extends DropdownItemState>
    extends State<MtpDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty)
          MtpInputFieldLabel(labelText: widget.labelText ?? ''),
        const SizedBox(height: Grid.half),
        DropdownButtonFormField2<T>(
          hint: Text(widget.hintText ?? ''),
          value: widget.selectedValue,
          isExpanded: true,
          decoration: mtpInputDecoration(context).copyWith(
            hintText: widget.hintText,
            errorText: widget.errorText,
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      item.itemLabel,
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            widget.onChanged(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        )
      ],
    );
  }
}
