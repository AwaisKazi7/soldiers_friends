import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/home_model.dart';

class HomeController extends GetxController {
  List<UserModel> users = [
    UserModel(
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    // Add more users as needed
  ];

  void addUser(UserModel user) {
    users.add(user);
    update();
  }

  void removeUser(UserModel user) {
    users.remove(user);
    update();
  }
}
