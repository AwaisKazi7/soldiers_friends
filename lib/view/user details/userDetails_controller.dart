import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/view/likes/likes_controller.dart';

class UserDetailsController extends GetxController {
  RxBool showmessageBox = false.obs;
  RxBool AddFriendloading = false.obs;
  RxBool Dislikeloading = false.obs;

  var likesController = Get.put(LikesController());

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  AddFriendApi(BuildContext context, homeModel userdata) async {
    AddFriendloading.value = true;
    var data = await supabse_DB.getInstance.AddFriendApi(context, userdata.id);
    AddFriendloading.value = false;
    if (data) {
      likesController.likesMeList.remove(userdata);
      showmessageBox.value = true;
    } else {
      showmessageBox.value = false;
    }
  }

  dislikeApi(BuildContext context, homeModel userdata) async {
    Dislikeloading.value = true;
    var data = await supabse_DB.getInstance.dislikeApi(context, userdata.id);
    Dislikeloading.value = false;
    if (data) {
      likesController.likesMeList.remove(userdata);
      Get.back();
    }
  }
}
