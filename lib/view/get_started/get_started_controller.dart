import 'package:get/get.dart';

import '../../routes/routes_name_strings.dart';
import '../login/login_controller.dart';

class GetStartedController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // navigate();
  }

  onGetStartedPressed() async{
    if((await LoginController().isUserLoggedIn()) == null){
    Get.toNamed(RoutesName.loginPage);
    }
    Get.toNamed(RoutesName.bottomnavbar);
  }

  // void navigate() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.offAndToNamed(RoutesName.getstartedPage);
  //   });
  //   update();
  // }
}
