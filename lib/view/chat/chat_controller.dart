import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class ChatViewController extends GetxController {
  RxList<FriendsModel> conversationList = <FriendsModel>[].obs;
  RxList<FriendsModel> filteredList = <FriendsModel>[].obs;

  final TextEditingController saerchController = TextEditingController();
  RxBool friendloading = false.obs;
  RxBool showsearch = false.obs;
  @override
  Future<void> onReady() async {
    super.onReady();
    await GetconversationList();
  }

  GetconversationList() async {
    try {
      friendloading.value = true;
      var Data = await supabse_DB.getInstance.GetconversationList();

      if (Data.length != 0) {
        conversationList.clear();
        conversationList.addAll(Data);
      } else {
        conversationList.clear();
      }
      friendloading.value = false;
    } catch (e) {
      print("Error in GetconversationList:${e}");
      friendloading.value = false;
    }
  }

  void filterConversations(String query) {
    if (query.isEmpty) {
      filteredList.value = conversationList;
    } else {
      filteredList.value = conversationList.where((friend) {
        return friend.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
