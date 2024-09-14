import 'package:get/get.dart';
import 'package:soldiers_friends/view/swipe_profile/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
