import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
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
    try {
      await supabse_DB.getInstance.Delete_user(context, Password);
    } catch (e) {
      print('Error during account deletion: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
    
  }
}
