import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/country_code.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/otp_verification.dart';

class CountryCodeController extends GetxController {
  // List of available country codes

  final loading = false.obs;
  final verifyotp = TextEditingController().obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final List<CountryCode> _countryCodes = [
    CountryCode(code: 'Select\nCode'),
    CountryCode(code: '+1'),
    CountryCode(code: '+44'),
    CountryCode(code: '+33'),
    CountryCode(code: '+92'),
    CountryCode(code: '+67'),
    CountryCode(code: '+71'),
    // Add more country codes as needed
  ];

  // Private selected country code
  CountryCode? _selectedCountryCode;

  // Getter for country codes
  List<CountryCode> get countryCodes => _countryCodes;

  // Getter for the selected country code
  CountryCode? get selectedCountryCode => _selectedCountryCode;

  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.usephonepage);
  //   });
  // }

  // Method to update the selected country code
  void selectCountryCode(CountryCode? countryCode) {
    _selectedCountryCode = countryCode;
    update(); // Notify listeners to rebuild
  }

  Future<void> mobileotp_Send(
      BuildContext context, var number) async {
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
