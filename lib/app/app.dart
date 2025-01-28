import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:mtp/app/chat_gpt_fab.dart';
import 'package:mtp/main.dart';
import 'package:mtp/routes/inherited_route_location.dart';
import 'package:ui/ui.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../routes/app_shell_routes.dart';
import 'app_navigation.dart';
import 'bloc/app_bloc.dart';

class MtpAppEntry extends StatefulWidget {
  const MtpAppEntry({super.key});

  @override
  State<MtpAppEntry> createState() => _MtpAppEntryState();
}

class _MtpAppEntryState extends State<MtpAppEntry> {
  final _appNavigator = AppNavigation();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return BlocProvider<AppBloc>(
            create: (_) => AppBloc()
              ..add(const AppLanguageFetched())
              ..add(const AppAuthStateFetched())
              ..add(const AppUserFetched())
              ..add(AppCmsMenusFetched()),
            child: MtpApp(appNavigation: _appNavigator),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MtpApp extends StatefulWidget {
  const MtpApp({
    super.key,
    required this.appNavigation,
  });

  final AppNavigation appNavigation;

  @override
  State<MtpApp> createState() => _MtpAppState();
}

class _MtpAppState extends State<MtpApp> {
  late final AppLifecycleListener _listener;
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    initDeepLinks();
    _listener = AppLifecycleListener(
      onResume: _onResume,
    );
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    _listener.dispose();
    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    widget.appNavigation.router.go(uri.fragment);
  }

  void _onResume() {
    if (NotificationHandler.detailId != null) {
      NotificationDetailRoutes(notiId: NotificationHandler.detailId!)
          .push(rootNavigatorKey.currentState!.context);
      NotificationHandler.detailId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        final lightTheme = LightMtpThemeData(locale: state.locale);
        final darkTheme = DarkMtpThemeData(locale: state.locale);
        return MtpTheme(
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          child: InheritedRouteLocation(
            currentLocation: ValueNotifier(''),
            child: MaterialApp.router(
              themeMode: ThemeMode.light,
              builder: (context, child) {
                return ResponsiveBreakpoints.builder(
                  breakpoints: [
                    Breakpoint(
                        start: WindowSizeClass.compact.maxWidth,
                        end: WindowSizeClass.compact.maxWidth,
                        name: WindowSizeClass.compact.name),
                    Breakpoint(
                        start: WindowSizeClass.medium.minWidth,
                        end: WindowSizeClass.medium.maxWidth,
                        name: WindowSizeClass.medium.name),
                    Breakpoint(
                        start: WindowSizeClass.expanded.minWidth,
                        end: WindowSizeClass.expanded.maxWidth,
                        name: WindowSizeClass.expanded.name),
                    Breakpoint(
                        start: WindowSizeClass.large.minWidth,
                        end: WindowSizeClass.large.maxWidth,
                        name: WindowSizeClass.large.name),
                    Breakpoint(
                        start: WindowSizeClass.xlarge.minWidth,
                        end: WindowSizeClass.xlarge.maxWidth,
                        name: WindowSizeClass.xlarge.name),
                  ],
                  child: Stack(
                    children: [
                      child!,
                      ListenableBuilder(
                          listenable: context.currentLocation,
                          builder: (context, child) {
                            if (_isChatGptScreen(
                                context.currentLocation.value)) {
                              return const SizedBox();
                            }
                            return ChatGptFab(
                              onPressed: () {
                                widget.appNavigation.router
                                    .push(ChatGPTDetailRoute().location);
                              },
                            );
                          }),
                    ],
                  ),
                );
              },
              debugShowCheckedModeBanner: false,
              title: 'MTP',
              restorationScopeId: 'router',
              theme: lightTheme.materialThemeData,
              darkTheme: darkTheme.materialThemeData,
              routerConfig: widget.appNavigation.router,
              locale: state.locale,
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                LocaleNamesLocalizationsDelegate(),
              ],
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        );
      },
    );
  }

  bool _isChatGptScreen(String location) =>
      location == ChatGPTDetailRoute().location;
}
