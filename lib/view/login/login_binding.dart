import 'package:get/get.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
