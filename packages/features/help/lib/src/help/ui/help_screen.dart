import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/help.dart';
import 'package:ui/ui.dart';

import '../bloc/help_bloc.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
    required this.onCmsMenuTapped,
    required this.onUserManualTapped,
    required this.onContactUsTapped,
    required this.onFaqTapped,
  });

  final OnCmsMenuTapped onCmsMenuTapped;
  final OnUserManualTapped onUserManualTapped;
  final OnContactUsTapped onContactUsTapped;
  final OnFaqTapped onFaqTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.helpLabelTitle),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: Grid.two),
                child: Column(
                  children: [
                    _CmsMenus(
                      onCmsMenuTapped: onCmsMenuTapped,
                    ),
                    ListTile(
                        title: Text(context.l10n.helpLabelUserManuals),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => onUserManualTapped()),
                    ListTile(
                      title:
                          Text(context.l10n.helpLabelFrequentlyAskedQuestions),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => onFaqTapped(),
                    ),
                    ListTile(
                      title: Text(context.l10n.helpLabelContactUs),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => onContactUsTapped(),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FutureBuilder(
              future: getAppVersion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    context.l10n.labelAppVersion(snapshot.data ?? ''),
                    style: context.textTheme.labelLarge,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: Grid.two),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Grid.two),
              child: Text(
                context.l10n.labelCopyright,
                textAlign: TextAlign.center,
                style: context.textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: Grid.two),
          ],
        ));
  }
}

class _CmsMenus extends StatelessWidget {
  const _CmsMenus({
    required this.onCmsMenuTapped,
  });

  final OnCmsMenuTapped onCmsMenuTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpBloc, HelpState>(
      buildWhen: (previous, current) =>
          previous.cmsMenusUiState != current.cmsMenusUiState,
      builder: (context, state) {
        return state.cmsMenusUiState.toView(context,
            successViewBuilder: (menus) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final menu in menus)
                ListTile(
                  title: Text(
                    menu.title,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => onCmsMenuTapped(
                    title: menu.title,
                    url: menu.url,
                  ),
                ),
            ],
          );
        });
      },
    );
  }
}
