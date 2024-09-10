import 'package:get/get.dart';
import 'package:soldiers_friends/view/sign_up/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
