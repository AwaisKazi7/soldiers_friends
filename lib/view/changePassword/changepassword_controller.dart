import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:soldiers_friends/services/SupabaseDB.dart';

class ChangePasswordController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  final formkey = GlobalKey<FormState>();

  final OldPasswordController = TextEditingController();
  final NewPasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  RxBool apihitting = false.obs;

  changePassword(BuildContext context) async {
    try {
      apihitting.value = true;
      var Data = await supabse_DB.getInstance.ChangePassword(
          context, OldPasswordController.text, NewPasswordController.text);
      apihitting.value = false;

      return Data;
    } catch (e) {
      // Generic error handling for any other exceptions
      print('Error: $e');
      apihitting.value = false;
      return false;
    }
  }
}
