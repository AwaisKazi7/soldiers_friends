import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

import '../../routes/routes_name_strings.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  RxBool apihitting = false.obs;

  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  /// Function to show an error message based on FirebaseAuthException code
  void showAuthError(BuildContext context, FirebaseAuthException e) {
    String errorMessage = '';

    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found for this email.';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is badly formatted.';
        break;
      default:
        errorMessage = 'An error occurred. Please try again.';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  /// Function to handle sign-in with email and password
  Future<void> login(BuildContext context) async {
    try {
      apihitting.value = true;
      await supabse_DB.getInstance
          .login(context, emailController.text, pwdController.text);
      apihitting.value = false;
    } catch (e) {
      // Generic error handling for any other exceptions
      print('Error: $e');
      apihitting.value = false;
    }
  }

  // Check if user is logged in and retrieve user info
  Future<User?> isUserLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser; // Get the current user
    if (user != null) {
      // User is logged in, you can also return user info if needed
      print(user);
      return user;
    }
    // User is not logged in
    return null;
  }

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.loginPage);
  //   });
  //   update();
  // }
}
