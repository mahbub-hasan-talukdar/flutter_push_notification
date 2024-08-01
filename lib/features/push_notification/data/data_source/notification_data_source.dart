import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationDataSource {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('In foreground!');
        print('Message data: ${message.data}');
        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    if (kDebugMode) {
      print(message.toString());
      if (message.data['type'] == 'chat') {
        print('message body: ');
        print(message.notification!.title);
      }
    }
  }

  Future<String?> getDeviceToken() async {
    try {
      String? token = await messaging.getToken();
      if (kDebugMode) {
        print(token);
      }
      return token;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting token: $e");
      }
      return null;
    }
  }
}
