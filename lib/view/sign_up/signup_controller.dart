import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.signuppage);
  //   });
  //   update();
  // }


  Future<User?> signUpWithEmailAndPhone(String email, String password,
      String phoneNumber, BuildContext context) async {
    try {
      // Create a user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful email/password sign up, link phone number
      if (userCredential.user != null) {
        // Verify phone number using Firebase Phone Auth
        // Disabling currently due to not enable billing

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Automatically link phone number if verification completes automatically
            await userCredential.user?.linkWithCredential(credential);
            print('Phone number linked successfully');
          },
          verificationFailed: (FirebaseAuthException e) {
            // Handle verification failure
            print('Phone verification failed: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) {
            // Handle when the verification code is sent
            print('Verification code sent to $phoneNumber');
            // Now, you need to prompt the user to enter the code and then use this code to sign in
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('Timeout for phone verification');
          },
        );

        return userCredential.user;
      }
      else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print('Sign up failed: ${e.message}');
      return null;
    }
    catch (e) {
      print('Sign up failed: ${e.toString()}');
      return null;
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
}

//---------------------------SEND OTP

//   Future<void> mobileotp_Send(var number) async {
//     try {
//       loading.value = true;
//       auth.verifyPhoneNumber(
//           phoneNumber: number,
//           verificationCompleted: (_) {
//             loading.value = !loading.value;
//           },
//           verificationFailed: (e) {
//             loading.value = false;
//             print(e.toString());
//             Fluttertoast.showToast(msg: 'OTP Service is having issue');
//             // Get.snackbar('Error', e.toString());
//           },
//           codeSent: (String verificationId, int? Token) {
//             loading.value = false;
//             Get.to(OtpScreen(
//               verfiyId: verificationId,
//               phonenumber: number,
//               IsloginOTP: Islogin,
//               name: name,
//             ));
//           },
//           codeAutoRetrievalTimeout: (e) {
//             loading.value = false;
//             print(e.toString());
//           });
//     } catch (e) {
//       print('error in otp function: $e');
//     }
//   }
//
//   //---------------------------VERIFICATION
//
//   Future<void> otp_verification(String verifyotp, String verifyId, String name,
//       String phone, bool Islogin, BuildContext context) async {
//     final credential = PhoneAuthProvider.credential(
//         verificationId: verifyId, smsCode: verifyotp);
//     try {
//       loading.value = true;
//       await auth.signInWithCredential(credential).then((value) async {
//         print(name);
//         print(phone);
//         if (Islogin == true) {
//           await AppService.getInstance.login(context, phone);
//           loading.value = false;
//         } else {
//           await AppService.getInstance.Registeration(context, phone, name);
//           loading.value = false;
//         }
//         // Get.to(() => Home_Bottom_Bar());
//         // );
//       }).onError((error, stackTrace) {
//         print(error.toString());
//         // Get.snackbar('Error', error.toString());
//       });
//     } catch (e) {
//       loading.value = !loading.value;
//       print(e.toString());
//       // Get.snackbar('Error', e.toString());
//     }
//   }
// }
