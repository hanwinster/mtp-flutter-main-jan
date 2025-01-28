import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MtpLanguageToggleSwitch extends StatelessWidget {
  const MtpLanguageToggleSwitch({
    super.key,
    required this.current,
    required this.onChanged,
  });

  final Language current;
  final Function(Language) onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<Language>.size(
        current: current,
        height: 40,
        style: ToggleStyle(
          backgroundColor: context.colorScheme.primary.withOpacity(0.36),
          indicatorColor: context.colorScheme.primary.withOpacity(0.87),
          borderColor: Colors.transparent,
          borderRadius: BorderRadius.circular(Grid.one),
          indicatorBorderRadius: BorderRadius.circular(Grid.one),
        ),
        iconOpacity: 1.0,
        selectedIconScale: 1.0,
        borderWidth: 0.0,
        iconAnimationType: AnimationType.onHover,
        styleAnimationType: AnimationType.onHover,
        spacing: 2.0,
        customIconBuilder: (context, local, global) {
          final text = Language.values[local.index].label;
          return Center(
              child: Text(text,
                  style: TextStyle(
                      color: Color.lerp(
                    Colors.black,
                    Colors.white,
                    local.animationValue,
                  ))));
        },
        values: Language.values,
        onChanged: (value) => onChanged(value));
  }
}
