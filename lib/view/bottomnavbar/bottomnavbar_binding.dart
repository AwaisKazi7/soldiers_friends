import 'package:get/get.dart';
import 'bottomnavbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavbarController());
  }
}
