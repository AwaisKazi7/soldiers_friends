import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/swipe_model.dart';

class SwipeProfileController extends GetxController {
  List<Profile> profiles = [];

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
  }

  void fetchProfiles() {
    // Fetch or initialize profiles here
    profiles = [
      Profile(name: 'Mark Peter', imagePath: CommonAssets.soldierswipeImage),
      Profile(name: '', imagePath: CommonAssets.rankImage),
    ];
    update();
  }
}
