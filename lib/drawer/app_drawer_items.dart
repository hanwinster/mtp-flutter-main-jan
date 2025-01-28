import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtp/routes/app_shell_routes.dart';
import 'package:ui/ui.dart';

import '../app/bloc/app_bloc.dart';

class AppDrawerLanguageItem extends StatelessWidget {
  const AppDrawerLanguageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MtpAssets.images.languageIcon.image(
        width: 24,
        height: 24,
        color: context.colorScheme.iconMediumEmphasis,
      ),
      trailing: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MtpLanguageToggleSwitch(
            current: state.languageOrDefault,
            onChanged: (language) {
              context.read<AppBloc>().add(
                    AppLanguageChanged(language),
                  );
            },
          );
        },
      ),
      title: Text(
        context.l10n.drawerItemLabelLanguage,
        style: context.textTheme.bodyMedium,
      ),
      onTap: () {},
    );
  }
}

class AppDrawerUserManualsItem extends StatelessWidget {
  const AppDrawerUserManualsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MtpAssets.images.userManualIcon.image(
        width: 24,
        height: 24,
        color: context.colorScheme.iconMediumEmphasis,
      ),
      title: Text(
        context.l10n.drawerItemLabelUserManuals,
        style: context.textTheme.bodyMedium,
      ),
      onTap: () => navigateToUserManual(context),
    );
  }
}

class AppDrawerFrequentlyAskedQuestions extends StatelessWidget {
  const AppDrawerFrequentlyAskedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MtpAssets.images.freqAskQuestionIcon.image(
        width: 24,
        height: 24,
        color: context.colorScheme.iconMediumEmphasis,
      ),
      title: Text(
        context.l10n.drawerItemLabelFrequentlyAskedQuestions,
        style: context.textTheme.bodyMedium,
      ),
      onTap: () => navigateToFAQ(context),
    );
  }
}

class AppDrawerContactUsItem extends StatelessWidget {
  const AppDrawerContactUsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MtpAssets.images.contactUsIcon.image(
        width: 24,
        height: 24,
        color: context.colorScheme.iconMediumEmphasis,
      ),
      title: Text(
        context.l10n.drawerItemLabelContactUs,
        style: context.textTheme.bodyMedium,
      ),
      onTap: () => navigateToContactUs(context),
    );
  }
}

class AppDrawerLogoutItem extends StatelessWidget {
  const AppDrawerLogoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (!state.isLoggedIn) {
          return const SizedBox.shrink();
        }

        return ListTile(
          leading: MtpAssets.images.logout.image(
            width: 24,
            height: 24,
          ),
          title: Text(
            context.l10n.drawerItemLabelLogOut,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
          onTap: () {
            context.read<AppBloc>().add(const AppLogoutRequested());
          },
        );
      },
    );
  }
}

class AppVersionCheckItem extends StatelessWidget {
  const AppVersionCheckItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: Grid.two),
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
        InkWell(
          onTap: () {
            context.read<AppBloc>().add(
                  AppVersionCheck(context),
                );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: Text(
              context.l10n.checkVersion,
              textAlign: TextAlign.center,
              style: context.textTheme.labelMedium
                  ?.copyWith(color: MtpColors.offlineFeatureGradientColor2),
            ),
          ),
        ),
        const SizedBox(height: Grid.two),
      ],
    );
  }
}
