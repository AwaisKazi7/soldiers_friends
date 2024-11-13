import 'package:get/get.dart';
import 'package:soldiers_friends/view/user_verification/userVerification_controller.dart';

class UserverificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserverificationController>(UserverificationController());
  }
}
