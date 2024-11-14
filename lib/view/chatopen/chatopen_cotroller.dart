import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/messageModel.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/view/chat/chat_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatDetailController extends GetxController {
  final chatcontrollers = Get.put(ChatViewController());
  final TextEditingController messagecontroller = TextEditingController();
  RxBool apihitting = false.obs;
  RxBool Blockloading = false.obs;
  RxList<MessageModel> messagesList = <MessageModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    // Uncomment if you want to navigate when the controller is ready
    // navigate();
  }

  sendMessage(int UserId, int mediiatype, int chatid) async {
    try {
      apihitting.value = true;
      var data = await supabse_DB.getInstance
          .sendMessage(UserId, messagecontroller.text, mediiatype, chatid);
      messagecontroller.clear();
      apihitting.value = false;
    } catch (e) {
      print("Error sendMessage:${e}");
    }
  }

  Stream<List<Map<String, dynamic>>> getMessages(int chat_id) {
    try {
      return Supabase.instance.client
          .from('chat_table')
          .stream(primaryKey: ['id'])
          .eq('chat_id', chat_id)
          .order('created_at', ascending: true);
    } catch (e) {
      print('error getMessages: $e');
      // return [];
      return const Stream.empty(); // Return an empty stream on error
    }
  }

  /// action = 1 >> block
  /// action = 0 >> Unblock
  Future<void> blockAccount(
      BuildContext context, int userId, int chatid, int action) async {
    try {
      Blockloading.value = true;
      await supabse_DB.getInstance.Block_user(context, userId, chatid, action);
      //  chatcontrollers.conversationList.firstWhere((e) => e.chatId == chatid,).isblocked = 1;
      await Get.find<ChatViewController>().GetconversationList();
      Blockloading.value = false;
    } catch (e) {
      Blockloading.value = false;
      print('Error during account deletion: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // GetMessage() async {
  //   try {
  //     var data = await supabse_DB.getInstance.GetMessage();

  //     if (data != null) {
  //       messagesList.addAll(data);
  //       return messagesList;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print("Error GetMessage:${e}");
  //     return [];
  //   }
  // }

  // Future<void> navigate() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offAndToNamed(RoutesName.getstartedPage);
  // }
}
