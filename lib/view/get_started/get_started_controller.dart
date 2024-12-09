import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/notificationService/localNotification.dart';
import 'package:soldiers_friends/notificationService/pushNotification_service.dart';
import 'package:soldiers_friends/services/localStorage.dart';

import '../../routes/routes_name_strings.dart';
import '../login/login_controller.dart';

class GetStartedController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  onGetStartedPressed() async {
    await LocalDataStorage.getInstance.getUserData();
    print('=========WELCOME BACK===========');
    print('USER NAME:${LocalDataStorage.username.value}');
    print('USER EMAIL:${LocalDataStorage.userEmail.value}');
    print('================================');
    if (LocalDataStorage.currentUserId.value == "") {
      Get.toNamed(RoutesName.loginPage);
    } else {
      Get.toNamed(RoutesName.bottomnavbar);
    }
  }

  Future<void> navigate(BuildContext context) async {
    LocalNotificationService.getInstance
        .initialize(context); //-----for displaying notifications
    // Handle cold start (app launched via notification)
    await PushnotificationService.getInstance.getAccessToken();
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        final route = message.data; // Extract the route
        if (route != null) {
          Fluttertoast.showToast(msg: 'navigate terminated:${message.data}');
          await LocalNotificationService.getInstance.handleNotification(route);
        }
      }
    });

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });

    // Handle background notifications
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final route = message.data['key'];
      LocalNotificationService.getInstance.handleNotification(route);
    });
  }
}
