import 'package:get/get.dart';
import 'package:soldiers_friends/view/settings/settings_controller.dart';


class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }
}