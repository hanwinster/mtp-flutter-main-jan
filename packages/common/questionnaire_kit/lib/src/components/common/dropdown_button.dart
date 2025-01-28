import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

class QkDropdownButton<T extends QkDropdownItem> extends StatelessWidget {
  const QkDropdownButton({
    super.key,
    this.hint,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.menuItemTextStyle,
    this.isCorrect,
  });

  final String? hintText;
  final Widget? hint;
  final T? value;
  final Function(T value) onChanged;
  final List<T> items;
  final TextStyle? menuItemTextStyle;
  final bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      value: value,
      items: items.map(
        (item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Row(
              children: [
                Expanded(
                  child: QuestionContentWidget(
                    content: item.option.content,
                    style: menuItemTextStyle,
                  ),
                ),
                if (isCorrect != null) ...[
                  if (isCorrect!)
                    const OptionCorrectIcon()
                  else
                    const OptionIncorrectIcon()
                ],
              ],
            ),
          );
        },
      ).toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      isExpanded: true,
      hint: hint ?? Text(hintText ?? ''),
      onChanged: isCorrect == null
          ? (value) {
              if (value != null) {
                onChanged(value);
              }
            }
          : null,
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
    );
  }
}
