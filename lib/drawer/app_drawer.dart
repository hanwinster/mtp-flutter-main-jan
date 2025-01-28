import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtp/routes/app_shell_routes.dart';
import 'package:ui/ui.dart';

import '../app/bloc/app_bloc.dart';
import 'app_drawer_header.dart';
import 'app_drawer_items.dart';

class MtpAppDrawer extends StatelessWidget {
  const MtpAppDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.authState != current.authState ||
          previous.loggedInUser != current.loggedInUser,
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              AppDrawerHeader(
                state: state,
                scaffoldKey: scaffoldKey,
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: Grid.one),
              const AppDrawerLanguageItem(),
              const _CmsMenus(),
              const AppDrawerContactUsItem(),
              const AppDrawerFrequentlyAskedQuestions(),
              const AppDrawerUserManualsItem(),
              const AppDrawerLogoutItem(),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              const AppVersionCheckItem(),
            ],
          ),
        );
      },
    );
  }
}

class _CmsMenus extends StatelessWidget {
  const _CmsMenus();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.cmsMenusUiState != current.cmsMenusUiState,
      builder: (context, state) {
        return state.cmsMenusUiState.toView(context,
            successViewBuilder: (menus) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: menus.map((menu) {
              return ListTile(
                leading: MtpImage(
                  menu.icon,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  menu.title,
                  style: context.textTheme.bodyMedium,
                ),
                onTap: () {
                  navigateToCms(
                    context,
                    title: menu.title,
                    url: menu.url,
                  );
                },
              );
            }).toList(),
          );
        });
      },
    );
  }
}
