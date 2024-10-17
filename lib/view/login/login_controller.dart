import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/routes_name_strings.dart';

class LoginController extends GetxController {
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
  Future<void> signInWithEmail(
      BuildContext context, String email, String password) async {
    try {
      // Attempt to sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        print("Sign-in successful!");
        Get.offAndToNamed(RoutesName.bottomnavbar);
      }
    } on FirebaseAuthException catch (e) {
      // Call the error handling function to show error message
      showAuthError(context, e);
    } catch (e) {
      // Generic error handling for any other exceptions
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
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

  Future<void> signOut(BuildContext context) async {
    try {
      // Check if a user is logged in
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // If there's a logged-in user, proceed to sign out
        await FirebaseAuth.instance.signOut();

        print("Sign-out successful!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have been signed out.'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to the login screen
        Get.offAllNamed(
            RoutesName.loginPage); // Adjust the route as per your app
      } else {
        // If no user is logged in, show a message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user is currently logged in.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      // Handle any errors
      print('Error during sign out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during sign out. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> deleteAccount(BuildContext context, String password) async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Re-authenticate the user (required for sensitive actions like account deletion)
        AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email!,
          password: password,
        );

        // Re-authenticate the user with the provided credentials
        await currentUser.reauthenticateWithCredential(credential);

        await currentUser.delete();

        print("Account deleted successfully!");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your account has been deleted successfully.'),
            backgroundColor: Colors.green,
          ),
        );

        Get.offAllNamed(RoutesName.loginPage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user is currently logged in.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The provided password is incorrect.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete account: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
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

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.loginPage);
  //   });
  //   update();
  // }
}
