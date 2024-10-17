import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';

class DeleteaccountController extends GetxController {
  bool isNotificationEnabled = false;
  final Logincontroller = Get.put(LoginController());
  final TextEditingController passowrdController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> deleteAccount(BuildContext context, String Password) async {
    await Logincontroller.deleteAccount(context, Password);
  }
}
