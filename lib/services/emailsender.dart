import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:email_otp/email_otp.dart';

class emailSender extends GetxController {
  static emailSender? _instance;
  static emailSender get getInstance => _instance ??= emailSender();

  init() async {
    try {
      EmailOTP.config(
        appName: 'Solider Friends App',
        otpType: OTPType.numeric,
        expiry: 30000,
        emailTheme: EmailTheme.v6,
        appEmail: 'support@hbox.digital',
        otpLength: 4,
      );
    } catch (e) {
      print("error in email sender: $e");
    }
  }

  sendOtp(String email) {
    try {
      var flag = EmailOTP.sendOTP(email: email);
      return flag;
    } catch (e) {
      print('Failed to send email: $e');
      return false;
    }
  }


verifyOTP(String OTP) {
    try {
      var flag = EmailOTP.verifyOTP(otp: OTP);
      return flag;
    } catch (e) {
      print('Failed to verify OTP: $e');
      return false;
    }
  }


  
}
