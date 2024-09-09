import 'package:get/get.dart';
import 'package:soldiers_friends/view/get_started/get_started_controller.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetStartedController>(GetStartedController());
  }
}
