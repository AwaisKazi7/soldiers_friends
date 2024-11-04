import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/messageModel.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/services/getx_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatDetailController extends GetxController {
  final controllersProvider = Get.put(GetxControllersProvider());
  final String chatName = "John Doe";
  final TextEditingController messagecontroller = TextEditingController();
  RxBool apihitting = false.obs;

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
    return Supabase.instance.client
        .from('chat_table')
        .stream(primaryKey: ['id'])
        .eq('chat_id', chat_id)
        .order('created_at', ascending: true);
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
