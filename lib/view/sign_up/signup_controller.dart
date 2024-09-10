import 'package:get/get.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';

class SignUpController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(RoutesName.signuppage);
    });
    update();
  }
}
