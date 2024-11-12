import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingController extends GetxController {
  bool isNotificationEnabled = false;
  RxBool isloggingout = false.obs;
  final Logincontroller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
  }

  void toggleNotification(bool value) {
    isNotificationEnabled = value;
    update();
  }

  Logout(BuildContext context) async {
    isloggingout.value = true;
    await LocalDataStorage.getInstance.logout(context);
    isloggingout.value = false;
    Get.offAllNamed(RoutesName.loginPage);
  }
}
