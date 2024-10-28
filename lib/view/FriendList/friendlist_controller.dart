import 'package:get/get.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class FriendListController extends GetxController {
  RxList<homeModel> FriendsList = <homeModel>[].obs;

  RxInt Likestab_Index = 0.obs;
  RxBool friendloading = false.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await GetfriendsList();
  }

  GetfriendsList() async {
    try {
      friendloading.value = true;
      var Data = await supabse_DB.getInstance.GetfriendsList();

      if (Data.length != 0) {
        FriendsList.clear();
        FriendsList.addAll(Data);
      }
      friendloading.value = false;
    } catch (e) {
      print("Error in GetfriendsList:${e}");
      friendloading.value = false;
    }
  }

  // void navigateToDetail(homeModel data) {
  //   Get.toNamed(RoutesName.userdetailview, arguments: data);
  // }
}
