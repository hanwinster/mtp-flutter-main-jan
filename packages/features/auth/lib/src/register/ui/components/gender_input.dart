import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class GenderInput extends StatelessWidget {
  const GenderInput({super.key});

  void _onChanged(BuildContext context, Gender? value) {
    if (value != null) {
      context.read<RegisterBloc>().add(RegisterGenderChanged(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.genderState != current.genderState ||
          previous.genderError != current.genderError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MtpInputFieldLabel(labelText: context.l10n.registerLabelGender),
            const SizedBox(height: Grid.half),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MtpRadioButton<Gender>(
                    titleText: Gender.male.getLabel(context),
                    value: Gender.male,
                    groupValue: state.genderState.value,
                    onChanged: (value) => _onChanged(context, value),
                  ),
                ),
                Expanded(
                  child: MtpRadioButton<Gender>(
                    titleText: Gender.female.getLabel(context),
                    value: Gender.female,
                    groupValue: state.genderState.value,
                    onChanged: (value) => _onChanged(context, value),
                  ),
                ),
                Expanded(
                  child: MtpRadioButton<Gender>(
                    titleText: Gender.other.getLabel(context),
                    value: Gender.other,
                    groupValue: state.genderState.value,
                    onChanged: (value) => _onChanged(context, value),
                  ),
                )
              ],
            ),
            Visibility(
              visible: state.genderError != null,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Grid.grid(2),
                  top: Grid.grid(1),
                ),
                child: MtpErrorText(
                  errorText: state.genderError?.resolveErrorMessage(
                        context,
                      ) ??
                      '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
