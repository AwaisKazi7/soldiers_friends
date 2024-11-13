import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/services/emailsender.dart';

class ResetPasswordController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  final formkey = GlobalKey<FormState>();

  final NewPasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  RxBool apihitting = false.obs;

  ResetPassword(BuildContext context,String email) async {
    try {
      apihitting.value = true;
      var Data = await supabse_DB.getInstance
          .ResetPassword(context, NewPasswordController.text,email);
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
