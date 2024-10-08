import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/likes_model.dart';

class LikesController extends GetxController {
  List<LikeModel> likesMeList = [
    LikeModel(name: 'Mark Peter', imagePath: CommonAssets.soldierswipeImage),
  ];

  List<LikeModel> myLikesList = [
    LikeModel(name: 'Qasim', imagePath: CommonAssets.soldierswipesecondImage),
    LikeModel(name: 'Mark Peter', imagePath: CommonAssets.soldierswipeImage),
  ];

  bool showLikesMe = true;

  void toggleLikes(bool isLikesMe) {
    showLikesMe = isLikesMe;
    update();
  }

  List<LikeModel> get currentLikesList =>
      showLikesMe ? likesMeList : myLikesList;

  void navigateToDetail(LikeModel like) {
    // Pass the selected person to the detail screen via Get.to
    // Get.toNamed('/detail', arguments: like);
  }
}
