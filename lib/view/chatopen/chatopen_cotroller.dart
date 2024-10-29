import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/messageModel.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatDetailController extends GetxController {
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

  sendMessage(int UserId, String mediiatype) async {
    try {
      apihitting.value = true;
      var data = await supabse_DB.getInstance
          .sendMessage(UserId, messagecontroller.text, mediiatype);

      apihitting.value = false;
    } catch (e) {
      print("Error sendMessage:${e}");
    }
  }

  GetMessage() async {
    try {
      var data = await supabse_DB.getInstance.GetMessage();

      if (data != null) {
        messagesList.addAll(data);
        return messagesList;
      } else {
        return [];
      }
    } catch (e) {
      print("Error GetMessage:${e}");
      return [];
    }
  }

  // Future<void> navigate() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offAndToNamed(RoutesName.getstartedPage);
  // }
}
