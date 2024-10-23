import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/likes_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';

class LikesController extends GetxController {
  RxList<homeModel> likesMeList = <homeModel>[].obs;

  List<homeModel> myLikesList = <homeModel>[].obs;

  bool showLikesMe = true;

  @override
  Future<void> onReady() async {
    super.onReady();
    await GetlikeUser();
  }

  void toggleLikes(bool isLikesMe) {
    showLikesMe = isLikesMe;
    update();
  }

  // List<LikeModel> get currentLikesList =>
  //     showLikesMe ? likesMeList : myLikesList;

  GetlikeUser() async {
    var Data = await supabse_DB.getInstance.GetLikeUsers();

    likesMeList.add(Data['likesMeList']);
    myLikesList.add(Data['myLikesList']);
  }

  void navigateToDetail(LikeModel like) {
    // Pass the selected person to the detail screen via Get.to
    // Get.toNamed('/detail', arguments: like);
  }
}
