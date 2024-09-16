import 'package:get/get.dart';
import 'package:soldiers_friends/model/chat_model.dart';

class ChatViewController extends GetxController {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
    ChatModel(
      name: 'Jennifer',
      lastMessage: 'How are you doing? How are you doing?',
      messageCount: 1,
      isOnline: true,
    ),
  ];

  void updateChats() {
    update();
  }

  @override
  void onReady() {
    super.onReady();
    // Uncomment if you want to navigate when the controller is ready
    // navigate();
  }

  // Future<void> navigate() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offAndToNamed(RoutesName.getstartedPage);
  // }
}
