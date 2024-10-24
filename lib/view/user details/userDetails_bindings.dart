import 'package:get/get.dart';
import 'package:soldiers_friends/view/user%20details/userDetails_controller.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserDetailsController>(UserDetailsController());
  }
}
