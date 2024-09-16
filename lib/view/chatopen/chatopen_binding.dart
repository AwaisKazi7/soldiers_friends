import 'package:get/get.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_cotroller.dart';

class ChatDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatDetailController());
  }
}
