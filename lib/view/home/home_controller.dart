import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/home_model.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/home/home_view.dart'; // Import other views if necessary

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

  void changeIndex(int index) {
    selectedIndex = index;
    update();

    switch (index) {
      case 0:
        Get.off(() => const HomeView());
        break;
      case 1:
        // Handle Matches navigation
        // Replace with your matches view if applicable
        break;
      case 2:
        Get.to(() => const ChatView());
        break;
      case 3:
        // Handle Profile navigation
        // Replace with your profile view if applicable
        break;
      default:
        break;
    }
  }
}
