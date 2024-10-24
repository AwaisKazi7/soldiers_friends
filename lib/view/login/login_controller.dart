import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/view/sign_up/signup_controller.dart';

import '../../routes/routes_name_strings.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  RxBool apihitting = false.obs;
  RxBool google_signin = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final SignUpcontroller = Get.put(SignUpController());
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

//----------------------Sign Up WITH Google----------------
  Future<void> signUpWithGoogle(BuildContext context) async {
    try {
      google_signin.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If the user cancels the sign-in, exit
      if (googleUser == null) {
        print('User canceled the sign-in process');
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String accessToken = googleAuth.accessToken ?? 'open12345#';

      final String email = googleUser.email;
      final String name = googleUser.displayName ?? '';

      final String? imageUrl = googleUser.photoUrl;

      print('User signed in with Google: $name');
      print('Email: $email');
      print('Profile image: $imageUrl');
      await supabse_DB.getInstance.Sociallogin(context, email, name);
      google_signin.value = false;
    } catch (e) {
      // Handle any errors
      print('Error during Google sign-in: $e');
      google_signin.value = false;
    }
  }
}
