import 'package:get/get.dart';
import 'package:soldiers_friends/view/likes/likes_controller.dart';

class LikesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LikesController>(LikesController());
  }
}
