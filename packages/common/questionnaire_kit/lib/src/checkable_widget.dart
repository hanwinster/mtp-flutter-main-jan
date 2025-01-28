import 'package:flutter/material.dart';

class CheckableWidget extends StatefulWidget {
  const CheckableWidget({super.key, required this.options});

  final List<String> options;

  @override
  State<CheckableWidget> createState() => _CheckableWidgetState();
}

class _CheckableWidgetState extends State<CheckableWidget> {
  final List<String> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return CheckboxListTile(
          key: Key(option),
          title: Text(option),
          controlAffinity: ListTileControlAffinity.leading,
          value: _selectedOptions.contains(option),
          onChanged: (selected) {
            if (selected == null) {
              return;
            }
            setState(() {
              if (selected) {
                _selectedOptions.add(option);
              } else {
                _selectedOptions.remove(option);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
