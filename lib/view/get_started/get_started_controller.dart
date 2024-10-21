import 'package:get/get.dart';
import 'package:soldiers_friends/services/localStorage.dart';

import '../../routes/routes_name_strings.dart';
import '../login/login_controller.dart';

class GetStartedController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  onGetStartedPressed() async {
    await LocalDataStorage.getInstance.getUserData();
    print('=========WELCOME BACK===========');
    print('USER NAME:${LocalDataStorage.username.value}');
    print('USER EMAIL:${LocalDataStorage.userEmail.value}');
    print('================================');
    if (LocalDataStorage.currentUserId.value == "") {
      Get.toNamed(RoutesName.loginPage);
    } else {
      Get.toNamed(RoutesName.bottomnavbar);
    }
  }

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.getstartedPage);
  //   });
  //   update();
  // }
}
