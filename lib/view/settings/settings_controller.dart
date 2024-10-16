import 'package:get/get.dart';

class SettingController extends GetxController {
  bool isNotificationEnabled = false;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleNotification(bool value) {
    isNotificationEnabled = value;
    update();
  }
}