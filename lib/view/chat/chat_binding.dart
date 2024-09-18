import 'package:get/get.dart';
import 'package:soldiers_friends/view/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatViewController>(ChatViewController());
  }
}
