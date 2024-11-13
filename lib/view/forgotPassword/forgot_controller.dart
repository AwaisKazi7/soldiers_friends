import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/country_code.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/emailsender.dart';
import 'package:soldiers_friends/view/forgotPassword/verificationScreen.dart';

class ForgotPasswordController extends GetxController {
  // List of available country codes

  final loading = false.obs;
  final verifyotp = TextEditingController().obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController OtpController = TextEditingController();
  RxBool apihitting = false.obs;

  RxBool ResendOtploading = false.obs;
  RxBool sendOtploading = false.obs;
  RxBool verifyOtploading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
  }

  sendEmail(BuildContext context, String email) async {
    try {
      sendOtploading.value = true;
      var flag = await emailSender.getInstance.sendOtp(email);
      if (flag) {
        Get.toNamed(RoutesName.otpVerification, arguments: {'email': email});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('There is some issue with email sender'),
            backgroundColor: Colors.red,
          ),
        );
      }
      sendOtploading.value = false;
    } catch (e) {
      print('Failed to send email: $e');
      sendOtploading.value = false;
    }
  }

  ResendEmail(BuildContext context, String email) async {
    try {
      ResendOtploading.value = true;
      var flag = await emailSender.getInstance.sendOtp(email);
      if (flag) {
        Get.toNamed(RoutesName.otpVerification, arguments: {'email': email});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('There is some issue with email sender'),
            backgroundColor: Colors.red,
          ),
        );
      }
      ResendOtploading.value = false;
    } catch (e) {
      print('Failed to send email: $e');
      ResendOtploading.value = false;
    }
  }

  otpVerification(BuildContext context, String OTP, String email) async {
    try {
      verifyOtploading.value = true;
      var flag = await emailSender.getInstance.verifyOTP(OTP);
      if (flag) {
        Get.toNamed(RoutesName.resetpasswordview, arguments: {'email': email});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('There is some issue with otp Verification'),
            backgroundColor: Colors.red,
          ),
        );
      }
      verifyOtploading.value = false;
    } catch (e) {
      print('Failed to send email: $e');
      verifyOtploading.value = false;
    }
  }

  Future<void> mobileotp_Send(BuildContext context, var number) async {
    try {
      loading.value = true;
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: (_) {
            loading.value = !loading.value;
          },
          verificationFailed: (e) {
            loading.value = false;
            print(e.toString());

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('OTP Service is having issue'),
                backgroundColor: Colors.red,
              ),
            );
          },
          codeSent: (String verificationId, int? Token) {
            loading.value = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('OTP Sent on ${number}'),
                backgroundColor: Colors.green,
              ),
            );
            // Get.to()
            // Get.to(OtpScreen(
            //   verfiyId: verificationId,
            //   phonenumber: number,
            //   IsloginOTP: Islogin,
            //   name: name,
            // ));
          },
          codeAutoRetrievalTimeout: (e) {
            loading.value = false;
            print(e.toString());
          });
    } catch (e) {
      print('error in otp function: $e');
    }
  }

  //---------------------------VERIFICATION

  Future<void> otp_verification(String verifyotp, String verifyId, String name,
      String phone, bool Islogin, BuildContext context) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: verifyotp);
    try {
      loading.value = true;
      await auth.signInWithCredential(credential).then((value) async {
        print(name);
        print(phone);
        if (Islogin == true) {
          // await AppService.getInstance.login(context, phone);
          loading.value = false;
        } else {
          // await AppService.getInstance.Registeration(context, phone, name);
          loading.value = false;
        }
        // Get.to(() => Home_Bottom_Bar());
        // );
      }).onError((error, stackTrace) {
        print(error.toString());
        // Get.snackbar('Error', error.toString());
      });
    } catch (e) {
      loading.value = !loading.value;
      print(e.toString());
      // Get.snackbar('Error', e.toString());
    }
  }
}
