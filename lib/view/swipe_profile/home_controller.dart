import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/home_model.dart';

class HomeController extends GetxController {
  // List of users (mock data or fetched from an API)
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

  // Index for the BottomNavigationBar
  int selectedIndex = 0;

  // Method to add a user
  void addUser(UserModel user) {
    users.add(user);
    update(); // Notify listeners
  }

  // Method to remove a user
  void removeUser(UserModel user) {
    users.remove(user);
    update(); // Notify listeners
  }

  // Method to change the selected index
  void changeIndex(int index) {
    selectedIndex = index;
    update(); // Notify listeners
  }
}
