import 'package:get/get.dart';
import 'package:soldiers_friends/view/changePassword/changepassword_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangePasswordController());
  }
}
