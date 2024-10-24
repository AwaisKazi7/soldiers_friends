import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class UserDetailsController extends GetxController {
  RxBool showmessageBox = false.obs;
  RxBool AddFriendloading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  AddFriendApi(BuildContext context, int userId) async {
    AddFriendloading.value = true;
    var data = await supabse_DB.getInstance.AddFriendApi(context, userId);
    AddFriendloading.value = false;
    if (data) {
      showmessageBox.value = true;
    } else {
      showmessageBox.value = false;
    }
  }
}
