import 'dart:async';
import 'dart:convert';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

const defaultNotificationChannelId = 'mtp_default_notification';
const defaultNotificationChannelName = 'Miscellaneous';
const defaultNotificationChannelDescription = 'Miscellaneous notifications';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
bool isFlutterLocalNotificationsInitialized = false;

final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

String? selectedNotificationPayload;

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  logger
      .d('Notification tapped in background: ${notificationResponse.payload}');
  logger.i(
      "noti response type is ${notificationResponse.notificationResponseType}");
  logger.i("noti response payload is ${notificationResponse.payload!}");

  final Map<String, dynamic> data = jsonDecode(notificationResponse.payload!);
  final String? detailId = data['data']['id'];
  if (detailId != null) {
    NotificationHandler.detailId = detailId;
  }
  if (notificationResponse.payload != null &&
      notificationResponse.payload != '') {
    handleNotificationTap(
      notificationResponse.payload,
    );
  } else {
    if (notificationResponse.id != null) {
      goToNotificationDetailPage(notificationResponse.id!);
    }
  }
}

Future<void> setupNotification() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  channel = const AndroidNotificationChannel(
    defaultNotificationChannelId,
    defaultNotificationChannelName,
    description: defaultNotificationChannelDescription,
    importance: Importance.high,
  );

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_stat_mtp_default');

  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      handleNotificationTap(notificationResponse.payload);
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  isFlutterLocalNotificationsInitialized = true;
}

void showNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  String? id = message.data['notification_id'];
  AndroidNotification? android = message.notification?.android;
  // final String? webLink = message.data['web_link'];

  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
        ),
      ),
      payload: jsonEncode({'data': message.data, 'id': id}),
    );
  }
}

void handleNotificationTap(String? payload,
    {GlobalKey<NavigatorState>? navigatorKey}) {
  if (payload != null) {
    Map<String, dynamic> data = jsonDecode(payload);
    String notiDetailId = data['data']['notification_id'];

    if (data['data'].containsKey('app_link')) {
      String actionLink = data['data']['app_link'];
      if (actionLink.isNotEmpty) {
        List<String> parts = actionLink.split('#');
        String route = parts.last;
        List<String> part2 = route.split('/');

        if (part2[1] == 'notifications') {
          _launchURL("mtp://#/notifications/$notiDetailId");
        } else {
          _launchURL(actionLink);
        }
      }
    } else {
      // notifications
      _launchURL("mtp://#/notifications/$notiDetailId");
    }
  }
}

Future<void> _launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    logger.e('Could not launch $url');
  }
}

void goToNotificationDetailPage(int notificationId) {
  // Implement your navigation logic here
  // rootNavigatorKey
  // For example, with GoRouter:
  // context.go('/notification-detail/$notificationId');
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
