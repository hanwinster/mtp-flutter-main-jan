import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../design_system.dart';

final supportedPhoneCountries = countries
    .where(
      (country) => country.code == 'MM' || country.code == 'TH',
    )
    .toList();

String? getDialedCode(String? countryCode) {
  final country =
      countries.firstWhereOrNull((element) => element.code == countryCode);

  if (supportedPhoneCountries.map((e) => e.code).contains(country?.code)) {
    return country?.dialCode;
  } else {
    return supportedPhoneCountries.first.dialCode;
  }
}

String? getCountryCodeFromDialCode(String dialCode) {
  final country =
      countries.firstWhereOrNull((element) => element.dialCode == dialCode);
  return country?.code;
}

class MtpOutlinePhoneField extends StatefulWidget {
  const MtpOutlinePhoneField({
    super.key,
    this.enabled = true,
    this.hintStyle,
    this.hintText,
    this.onSubmitted,
    this.focusNode,
    required this.onNumberChanged,
    required this.onCountryCodeChanged,
    this.readOnly = false,
    this.textInputAction,
    this.labelText,
    this.helperText,
    this.errorText,
    this.decoration,
    this.controller,
    this.borderColor,
    this.borderWidth,
    this.isDense = false,
    this.initialCountryCode,
    this.showCountryFlag = false,
    this.disableLengthCheck = true,
  });

  final bool enabled;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onCountryCodeChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final TextEditingController? controller;
  final Color? borderColor;
  final double? borderWidth;
  final bool isDense;

  final String? initialCountryCode;
  final bool showCountryFlag;
  final bool disableLengthCheck;

  @override
  State<MtpOutlinePhoneField> createState() => _MtpOutlinePhoneFieldState();
}

class _MtpOutlinePhoneFieldState extends State<MtpOutlinePhoneField> {
  late List<Country>? _supportedCountries;

  @override
  void initState() {
    _supportedCountries = supportedPhoneCountries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          MtpInputFieldLabel(
            labelText: widget.labelText ?? '',
          ),
          const SizedBox(height: Grid.half),
        ],
        IntlPhoneField(
          countries: _supportedCountries,
          controller: widget.controller,
          enabled: widget.enabled,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.onSubmitted,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          initialCountryCode: widget.initialCountryCode,
          showCountryFlag: widget.showCountryFlag,
          onChanged: (phone) => widget.onNumberChanged(phone.number),
          onCountryChanged: (country) =>
              widget.onCountryCodeChanged(country.dialCode),
          dropdownTextStyle: context.textTheme.bodyLarge,
          disableLengthCheck: widget.disableLengthCheck,
          decoration: widget.decoration ??
              mtpInputDecoration(
                context,
                borderColor: widget.borderColor,
                borderWidth: widget.borderWidth,
              ).copyWith(
                isDense: widget.isDense,
                hintText: widget.hintText,
                helperMaxLines: 3,
                errorText: widget.errorText,
                helperText: widget.helperText,
                hintStyle: widget.hintStyle,
              ),
        ),
      ],
    );
  }
}
