import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

TextInputFormatter get numberOnlyTextInputFormatter =>
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

TextInputFormatter get digitOnlyTextInputFormatter =>
    FilteringTextInputFormatter.digitsOnly;

TextInputFormatter get emailTextInputFormatter =>
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-@]'));

TextStyle? mtpInputTextStyle(BuildContext context, bool inverseTheme) =>
    context.textTheme.bodyLarge;

InputDecoration mtpInputDecoration(
  BuildContext context, {
  Color? borderColor,
  double? borderWidth,
  double? borderRadius,
  bool inverseTheme = false,
}) =>
    const InputDecoration(
      border: OutlineInputBorder(),
    );

class MtpOutlineTextField extends StatefulWidget {
  const MtpOutlineTextField({
    super.key,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.hintStyle,
    this.hintText,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.numberOnly = false,
    this.digitOnly = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.labelText,
    this.helperText,
    this.errorText,
    this.suffixText,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.borderColor,
    this.borderWidth,
    this.isCurrencyInput = false,
    this.isDense = false,
    this.inverseTheme = false,
    this.maxLines = 1,
    this.minLines = 1,
  });

  final bool enabled;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool numberOnly;
  final bool digitOnly;
  final bool readOnly;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final String? suffixText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Color? borderColor;
  final double? borderWidth;
  final bool isCurrencyInput;
  final bool isDense;
  final bool inverseTheme;
  final int maxLines;
  final int minLines;

  @override
  State<MtpOutlineTextField> createState() => _MtpOutlineTextFieldState();
}

class _MtpOutlineTextFieldState extends State<MtpOutlineTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputFormatters = <TextInputFormatter>[
      ...(widget.inputFormatters ?? []),
      if (widget.numberOnly) numberOnlyTextInputFormatter,
      if (widget.digitOnly) digitOnlyTextInputFormatter,
    ];
    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      decoration: widget.decoration ??
          mtpInputDecoration(
            context,
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            inverseTheme: widget.inverseTheme,
          ).copyWith(
            isDense: widget.isDense,
            hintText: widget.hintText,
            suffix: widget.suffix ??
                (widget.suffixText != null
                    ? MtpTextFieldSuffixText(widget.suffixText,
                        inverseTheme: widget.inverseTheme)
                    : (widget.isCurrencyInput
                        ? MtpTextFieldSuffixText(
                            NumberFormat.simpleCurrency(
                              locale: context.locale,
                            ).currencySymbol,
                            inverseTheme: widget.inverseTheme,
                          )
                        : null)),
            labelText: widget.labelText,
            errorText: widget.errorText,
            helperText: widget.helperText,
            helperMaxLines: 3,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintStyle: widget.hintStyle,
          ),
    );
  }
}

class MtpOutlinePasswordField extends StatefulWidget {
  const MtpOutlinePasswordField({
    super.key,
    this.initialValue,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.hintStyle,
    this.hintText,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.borderColor,
    this.borderWidth,
    this.isCurrencyInput = false,
    this.inverseTheme = false,
  });

  final String? initialValue;
  final bool enabled;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Color? borderColor;
  final double? borderWidth;
  final bool isCurrencyInput;
  final bool inverseTheme;

  @override
  State<MtpOutlinePasswordField> createState() =>
      _MtpOutlinePasswordFieldState();
}

class _MtpOutlinePasswordFieldState extends State<MtpOutlinePasswordField> {
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
// Only dispose the controller if it was created in this class
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  IconData get _passwordVisibilityIcon =>
      _obscureText ? Icons.visibility : Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      decoration: widget.decoration ??
          mtpInputDecoration(context).copyWith(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: Icon(_passwordVisibilityIcon),
            ),
            labelText: widget.labelText,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            hintStyle: widget.hintStyle,
            helperText: widget.helperText,
          ),
    );
  }
}

class MtpTextField extends StatefulWidget {
  const MtpTextField({
    super.key,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.hintStyle,
    this.hintText,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.numberOnly = false,
    this.digitOnly = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.labelText,
    this.helperText,
    this.errorText,
    this.suffixText,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.borderColor,
    this.borderWidth,
    this.isCurrencyInput = false,
    this.isDense = false,
    this.inverseTheme = false,
    this.maxLines,
  });

  final bool enabled;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool numberOnly;
  final bool digitOnly;
  final bool readOnly;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final String? suffixText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Color? borderColor;
  final double? borderWidth;
  final bool isCurrencyInput;
  final bool isDense;
  final bool inverseTheme;
  final int? maxLines;

  @override
  State<MtpTextField> createState() => _MtpTextFieldState();
}

class _MtpTextFieldState extends State<MtpTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputFormatters = <TextInputFormatter>[
      ...(widget.inputFormatters ?? []),
      if (widget.numberOnly) numberOnlyTextInputFormatter,
      if (widget.digitOnly) digitOnlyTextInputFormatter,
    ];

    return TextField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      enabled: widget.enabled,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      decoration: widget.decoration ??
          mtpInputDecoration(
            context,
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            inverseTheme: widget.inverseTheme,
          ).copyWith(
            isDense: widget.isDense,
            hintText: widget.hintText,
            suffix: widget.suffix ??
                (widget.suffixText != null
                    ? MtpTextFieldSuffixText(widget.suffixText,
                    inverseTheme: widget.inverseTheme)
                    : (widget.isCurrencyInput
                    ? MtpTextFieldSuffixText(
                  NumberFormat.simpleCurrency(
                    locale: context.locale,
                  ).currencySymbol,
                  inverseTheme: widget.inverseTheme,
                )
                    : null)),
            labelText: widget.labelText,
            errorText: widget.errorText,
            helperText: widget.helperText,
            helperMaxLines: 3,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintStyle: widget.hintStyle,
          ),
    );
  }
}

class MtpTextFieldSuffixText extends StatelessWidget {
  const MtpTextFieldSuffixText(
    this.suffixText, {
    required this.inverseTheme,
    super.key,
  });

  final String? suffixText;
  final bool inverseTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      suffixText ?? '',
      style: context.textTheme.labelLarge,
    );
  }
}
