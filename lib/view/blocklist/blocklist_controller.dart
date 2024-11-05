import 'package:get/get.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class BlockListController extends GetxController {
  RxList<FriendsModel> blockList = <FriendsModel>[].obs;

  RxInt Likestab_Index = 0.obs;
  RxBool loading = false.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await GetBlockedFriendsList();
  }

  GetBlockedFriendsList() async {
    try {
      loading.value = true;
      var Data = await supabse_DB.getInstance.GetBlockedFriendsList();

      if (Data.length != 0) {
        blockList.clear();
        blockList.addAll(Data);
      }
      loading.value = false;
    } catch (e) {
      print("Error in GetBlockedFriendsList:${e}");
      loading.value = false;
    }
  }

  // void navigateToDetail(homeModel data) {
  //   Get.toNamed(RoutesName.userdetailview, arguments: data);
  // }
}
