import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import '../../bloc/bloc.dart';

class RemarkInput extends StatelessWidget {
  const RemarkInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewFormBloc, ReviewFormState>(
      buildWhen: (previous, current) =>
          previous.remarkState != current.remarkState ||
          previous.remarkError != current.remarkError,
      builder: (context, state) {
        return MtpOutlineTextField(
          maxLines: 8,
          minLines: 5,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            context.read<ReviewFormBloc>().add(ReviewFormRemarkChanged(value));
          },
          errorText: state.remarkError?.resolveErrorMessage(context),
        );
      },
    );
  }
}
