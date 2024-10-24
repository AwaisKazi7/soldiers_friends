import 'package:get/get.dart';
import 'package:soldiers_friends/view/FriendList/friendlist_controller.dart';
import 'package:soldiers_friends/view/likes/likes_controller.dart';

class FriendListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FriendListController>(FriendListController());
  }
}
