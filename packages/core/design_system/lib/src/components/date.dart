import 'package:flutter/material.dart';

import '../../design_system.dart';

class MtpOutlineDateField extends StatefulWidget {
  const MtpOutlineDateField({
    super.key,
    required this.focusNode,
    required this.onDateSelected,
    required this.onFieldSubmitted,
    required this.restorationId,
    required this.labelText,
    required this.errorText,
    required this.textInputAction,
    required this.value,
    this.inverseTheme = false,
  });
  final FocusNode focusNode;
  final Function(DateTime) onDateSelected;
  final Function() onFieldSubmitted;
  final String? restorationId;
  final String? labelText;
  final String? errorText;
  final TextInputAction? textInputAction;
  final DateTime? value;
  final bool inverseTheme;

  @override
  State<MtpOutlineDateField> createState() =>
      _MtpOutlineDateFieldState();
}

class _MtpOutlineDateFieldState extends State<MtpOutlineDateField>
    with RestorationMixin {
  late TextEditingController controller;

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @override
  void initState() {
    controller = TextEditingController();
    if (widget.value != null) {
      updateUi(widget.value);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateUi(DateTime? date) {
    controller.text = date?.asShortDate(context) ?? '';
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        widget.onDateSelected(newSelectedDate);
        updateUi(newSelectedDate);
      });
    }
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  Widget build(BuildContext context) {
    return MtpOutlineTextField(
      controller: controller,
      inverseTheme: widget.inverseTheme,
      labelText: widget.labelText,
      // suffixIcon: Icon(
      //   Icons.calendar_today,
      //   color: widget.inverseTheme
      //       ? context.colorScheme.iconInverse
      //       : context.colorScheme.icon,
      // ),
      textInputAction: widget.textInputAction,
      onSubmitted: (_) => widget.onFieldSubmitted(),
      focusNode: widget.focusNode,
      readOnly: true,
      onTap: () {
        _restorableDatePickerRouteFuture.present();
      },
      errorText: widget.errorText,
    );
  }
}
