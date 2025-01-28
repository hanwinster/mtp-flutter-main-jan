import 'package:firebase_core/firebase_core.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:messaging/messaging.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../firebase_options/firebase_options_dev.dart' as firebase_options_dev;
import '../firebase_options/firebase_options_prod.dart'
    as firebase_options_prod;
import '../firebase_options/firebase_options_qa.dart' as firebase_options_qa;
import 'app/app.dart';
import 'service_locator/service_locator.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  tz.initializeTimeZones();

  initFlavor();
  await setupServiceLocator();
  await setupFlutterInAppWebView();
  await setupMessaging(firebaseOptions: firebaseOptions);

  runApp(
    const RootRestorationScope(
      restorationId: 'root',
      child: MtpAppEntry(),
    ),
  );
}

FirebaseOptions get firebaseOptions {
  if (appFlavor == Flavor.dev.name) {
    return firebase_options_dev.DefaultFirebaseOptions.currentPlatform;
  } else if (appFlavor == Flavor.qa.name) {
    return firebase_options_qa.DefaultFirebaseOptions.currentPlatform;
  } else if (appFlavor == Flavor.prod.name) {
    return firebase_options_prod.DefaultFirebaseOptions.currentPlatform;
  } else {
    throw Exception('Unknown FLUTTER_APP_FLAVOR: $appFlavor');
  }
}

void initFlavor() {
  if (appFlavor == Flavor.dev.name) {
    FlavorConfig.setupDevFlavor();
  } else if (appFlavor == Flavor.qa.name) {
    FlavorConfig.setupQaFlavor();
  } else if (appFlavor == Flavor.prod.name) {
    FlavorConfig.setupProdFlavor();
  } else {
    throw Exception('Unknown FLUTTER_APP_FLAVOR: $appFlavor');
  }
}

Future<void> setupMessaging({
  required FirebaseOptions? firebaseOptions,
}) async {
  await Messaging(firebaseOptions: firebaseOptions).init();
}

Future<void> setupFlutterInAppWebView() async {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
}
