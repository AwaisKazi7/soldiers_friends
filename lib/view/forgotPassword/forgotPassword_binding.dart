import 'package:get/get.dart';
import 'package:soldiers_friends/view/forgotPassword/forgot_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
