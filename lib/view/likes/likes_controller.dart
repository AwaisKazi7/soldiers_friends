import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/likes_model.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class LikesController extends GetxController {
  RxList<homeModel> likesMeList = <homeModel>[].obs;
  List<homeModel> myLikesList = <homeModel>[].obs;

  RxInt Likestab_Index = 0.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await GetlikeUser();
  }

  void toggleLikes(int index) {
    Likestab_Index.value = index;
  }

  GetlikeUser() async {
    var Data = await supabse_DB.getInstance.GetLikeUsers();
    if (Data['likesMeList'].length != 0) {
      likesMeList.addAll(Data['likesMeList']);
    }
    if (Data['myLikesList'].length != 0) {
      myLikesList.addAll(Data['myLikesList']);
    }
  }

  void navigateToDetail(homeModel data) {
    Get.toNamed(RoutesName.userdetailview, arguments: data);
  }
}
