import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';

class SettingController extends GetxController {
  bool isNotificationEnabled = false;
  final Logincontroller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
  }

  void toggleNotification(bool value) {
    isNotificationEnabled = value;
    update();
  }

  Future<void> Logout(BuildContext context) async {
    await Logincontroller.signOut(context);
  }

  // Future<void> deleteAccount(BuildContext context) async {
  //   await Logincontroller.deleteAccount(context);
  // }
}
