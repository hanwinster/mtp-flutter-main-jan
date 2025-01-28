import 'dart:io';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:preferences/preferences.dart';
import 'package:rxdart/rxdart.dart';
import '../notification/notification.dart';

final _messageStreamController = BehaviorSubject<RemoteMessage>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  logger.d("Handling a background message: ${message.messageId}");
  logger.d('Message data: ${message.data}');
  logger.d('Message notification: ${message.notification?.title}');
  logger.d('Message notification: ${message.notification?.body}');

  await setupNotification();
  showNotification(message);
}

Future<void> setupFirebase({
  required FirebaseOptions? firebaseOptions,
  PreferencesDataSource? preferenceDataSource,
  FcmTokenUseCase? fcmTokenUsecase,
}) async {
  try {
    // Ensure Firebase is initialized only once
    if (Firebase.apps.isEmpty) {
      if (defaultTargetPlatform == TargetPlatform.android && !kIsWeb) {
        await Firebase.initializeApp();
      } else if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
        await Firebase.initializeApp();
      } else if (firebaseOptions != null) {
        await Firebase.initializeApp(options: firebaseOptions);
      } else {
        throw Exception('FirebaseOptions must be provided for non-mobile platforms');
      }
    }

    final PreferencesDataSource pref = preferenceDataSource ?? getIt();

    final messaging = FirebaseMessaging.instance;

    // Set foreground notification presentation options
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await messaging.requestPermission();

    // https://github.com/firebase/flutterfire/issues/11946#issuecomment-1864199767
    if (Platform.isIOS) {
      String? apnsToken = await messaging.getAPNSToken();
      if (apnsToken == null) {
        await Future<void>.delayed(
          const Duration(
            seconds: 3,
          ),
        );
      }
    }

    String? token = await messaging.getToken();
    int retries = 3;
    while (token == null && retries > 0) {
      await Future.delayed(const Duration(seconds: 2));
      token = await messaging.getToken();
      retries--;
    }
    logger.d('FCM Token: $token');

    if (token != null) {
      await pref.putFcmToken(token);

      // Send the new token to the server
      AuthState authState = await pref.getAuthState();
      if (authState.isLoggedIn) {
        final FcmTokenUseCase fcmTokenUseCase = fcmTokenUsecase ?? getIt();
        await fcmTokenUseCase(token);
      }
    }

    messaging.onTokenRefresh.listen((String? newToken) async {
      logger.d('Token refreshed: $newToken');
      if (newToken != null) {
        await pref.putFcmToken(newToken);

        // Send the new token to the server
        AuthState authState = await pref.getAuthState();
        if (authState.isLoggedIn) {
          final FcmTokenUseCase fcmTokenUseCase = fcmTokenUsecase ?? getIt();
          await fcmTokenUseCase(newToken);
        }
      }
    });

    // Handle messages received in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      logger.d('Handling a foreground message: ${message.messageId}');
      logger.d('Message data: ${message.data}');
      logger.d('Message notification: ${message.notification?.title}');
      logger.d('Message notification: ${message.notification?.body}');

      _messageStreamController.sink.add(message);
      await setupNotification();
      showNotification(message);
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } catch (e) {
    logger.e('Failed to initialize Firebase: $e');
  }
}
