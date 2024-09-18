import 'package:get/get.dart';

import 'package:soldiers_friends/view/subscribtion/subscribtion_controller.dart';

class SubscribtionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SubscribtionController>(SubscribtionController());
  }
}
