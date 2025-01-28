export 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:async';

import 'package:base/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:preferences/preferences.dart';
import 'src/fcm/fcm.dart';
import 'src/notification/notification.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  await setupNotification();
  showNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  logger.d('Handling a background message ${message.messageId}');
}

class Messaging {
  Messaging._internal();

  static final Messaging _instance = Messaging._internal();

  FirebaseOptions? _firebaseOptions;

  factory Messaging({required FirebaseOptions? firebaseOptions}) {
    final instance = _instance;
    instance._firebaseOptions = firebaseOptions;
    return instance;
  }

  Future<void> init({PreferencesDataSource? preference}) async {
    await setupNotification();
    await setupFirebase(firebaseOptions: _firebaseOptions,preferenceDataSource: preference);
  }
}
