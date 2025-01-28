import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/faq/ui/faq_list.dart';
import 'package:ui/ui.dart';

import '../bloc/faq_bloc.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.drawerItemLabelFaq),
      ),
      body: BlocBuilder<FaqBloc, FaqState>(
        buildWhen: (previous, current) =>
            previous.faqsUiState != current.faqsUiState,
        builder: (context, state) {
          return state.faqsUiState.toView(
            context,
            successViewBuilder: (items) {
              return FaqList(items: items);
            },
          );
        },
      ),
    );
  }
}
