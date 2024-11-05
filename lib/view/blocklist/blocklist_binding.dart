import 'package:get/get.dart';
import 'package:soldiers_friends/view/blocklist/blocklist_controller.dart';

class BlockListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BlockListController>(BlockListController());
  }
}
