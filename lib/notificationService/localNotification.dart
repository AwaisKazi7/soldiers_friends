import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_controller.dart';

class LocalNotificationService {

static LocalNotificationService? _instance;
  static LocalNotificationService get getInstance =>
      _instance ??= LocalNotificationService();

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

   void initialize(BuildContext context) {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle the notification tap
        if (response.payload != null) {
          print('payload:${response.payload}');
          handleNotification(response.payload!);
        }
      },
    );
  }

  static void display(RemoteMessage message) async {
    try {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null) {
        const AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
        );

        const NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);

        await _notificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          platformChannelSpecifics,
          payload: message.data['key'], // Pass the route as payload
        );
      }
    } catch (e) {
      print('Error displaying notification: $e');
    }
  }

  handleNotification(String type) {
    if (type == 'NewRequest') {
      var controler = Get.put(NavbarController());
      Get.toNamed(RoutesName.bottomnavbar);
      controler.onTabTapped(1);
    } else if (type == 'FriendList') {
      var controler = Get.put(NavbarController());
      Get.toNamed(RoutesName.bottomnavbar);
      controler.onTabTapped(3);
      Get.toNamed(RoutesName.friendlistview);
    }
    else if (type == 'newmessage') {
      var controler = Get.put(NavbarController());
      Get.toNamed(RoutesName.bottomnavbar);
      controler.onTabTapped(2);
    }
  }
}
