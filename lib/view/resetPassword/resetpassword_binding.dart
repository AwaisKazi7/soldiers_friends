import 'package:get/get.dart';
import 'package:soldiers_friends/view/forgotPassword/forgot_controller.dart';
import 'package:soldiers_friends/view/resetPassword/resetpassword_Controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}
