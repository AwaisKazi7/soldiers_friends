import 'package:get/get.dart';
import 'package:soldiers_friends/view/friend%20detail/friendDetails_controller.dart';

class FriendDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FriendDetailsController>(FriendDetailsController());
  }
}
