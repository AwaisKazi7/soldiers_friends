import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/users_model.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
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
          Map<String, dynamic> payload = json.decode(response.payload!);
          print('payload:${payload}');

          handleNotification(payload);
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

        await _notificationsPlugin.show(notification.hashCode,
            notification.title, notification.body, platformChannelSpecifics,
            payload: json.encode(message.data));
      }
    } catch (e) {
      print('Error displaying notification: $e');
    }
  }

  String fixJson(String invalidJson) {
    return invalidJson
        .replaceAllMapped(RegExp(r'([a-zA-Z0-9_]+):'),
            (match) => '"${match[1]}":') // Add quotes to keys
        .replaceAll("'", '"') // Replace single quotes with double quotes
        .replaceAll(RegExp(r'(\s*):(\s*)'),
            ':') // Remove unnecessary spaces around colons
        .replaceAllMapped(RegExp(r'(?<=\s|^)([0-9a-zA-Z_]+):'),
            (match) => '"${match[1]}":'); // Add quotes
  }

  handleNotification(Map<String, dynamic> payload) async {
    try {
      if (payload['key'] == 'NewRequest') {
        var controler = Get.put(NavbarController());
        Get.toNamed(RoutesName.bottomnavbar);
        controler.onTabTapped(1);
      } else if (payload['key'] == 'FriendList') {
        var userId = int.parse(payload['userId']);
        var data = await supabse_DB.getInstance.GetfriendData_by_Id(userId);

        if (data != null) {
          var controler = Get.put(NavbarController());
          Get.toNamed(RoutesName.bottomnavbar);
          controler.onTabTapped(2);
          Get.toNamed(RoutesName.frienddetailview, arguments: data);
        }
      } else {
        var chatid = int.parse(payload['chatId']);
        var data = await supabse_DB.getInstance.GetUserData_by_chatId(chatid);

        if (data != null) {
          var controler = Get.put(NavbarController());
          Get.toNamed(RoutesName.bottomnavbar);
          controler.onTabTapped(2);
          Get.toNamed(RoutesName.chatdetails, arguments: data);
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
