import 'package:get/get.dart';
import 'package:soldiers_friends/view/swipe_profile/swipe_profile_controller.dart';

class SwipeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SwipeProfileController>(SwipeProfileController());
  }
}
