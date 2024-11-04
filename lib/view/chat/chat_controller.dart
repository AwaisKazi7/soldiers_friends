import 'package:get/get.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class ChatViewController extends GetxController {
  RxList<FriendsModel> conversationList = <FriendsModel>[].obs;

  RxBool friendloading = false.obs;

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
      }
      friendloading.value = false;
    } catch (e) {
      print("Error in GetconversationList:${e}");
      friendloading.value = false;
    }
  }
}
