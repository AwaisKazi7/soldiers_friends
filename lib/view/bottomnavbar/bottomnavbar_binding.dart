import 'package:get/get.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_controller.dart';

class BottomNavbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NavbarController>(NavbarController());
  }
}
