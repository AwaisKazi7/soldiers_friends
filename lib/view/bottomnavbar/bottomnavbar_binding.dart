import 'package:get/get.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>;
  }
}
