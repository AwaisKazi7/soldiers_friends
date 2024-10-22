import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/users_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  final formkey = GlobalKey<FormState>();

  final fullnameController = TextEditingController();
  final EmailController = TextEditingController();
  final phoneController = TextEditingController();
  final PassowrdController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FocusNode NameFocusNode = FocusNode();
  final FocusNode EmailFocusNode = FocusNode();
  final FocusNode PhoneFocusNode = FocusNode();
  final FocusNode PasswordFocusNode = FocusNode();
  final FocusNode ConfirmPasswordFocusNode = FocusNode();

  RxBool apihitting = false.obs;

  signUp(BuildContext context) async {
    try {
      apihitting.value = true;
      var Data = await supabse_DB.getInstance.registerUser(
          context,
          fullnameController.text,
          phoneController.text,
          EmailController.text,
          PassowrdController.text);
      apihitting.value = false;
      return Data;
    } catch (e) {
      print('ERROR IN Sign Up :${e}');
      return false;
    }
  }
}
