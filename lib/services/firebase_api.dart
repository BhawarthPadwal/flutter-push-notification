import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/app.dart';

/// A class to handle Firebase Cloud Messaging (FCM) services.
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// Initializes notifications, requests permissions, and gets the FCM token.
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    print('🔑 FCM Token: $fCMToken');

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    initPushNotifications();
  }

  /// Initializes push notification listeners for foreground and opened app states.
  Future<void> initPushNotifications() async {
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      // Display in-app notification or navigate
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: Text(notification.title ?? 'No Title'),
          content: Text(notification.body ?? 'No Body'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/notification');
              },
              child: const Text("Open"),
            ),
          ],
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      navigatorKey.currentState?.pushNamed('/notification');
    });
  }

  /// Handles background messages when the app is not active.
  @pragma('vm:entry-point')
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print('🕒 Background Message:');
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Data: ${message.data}');
  }
}
