import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/home_model.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/home/home_view.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    cardController;
  }

  CardController cardController = CardController();
  // List of users (mock data or fetched from an API)
  List<UserModel> users = [
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
      name: 'Qasim',
      location: 'San Francisco',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 0,
      name: 'Mark Peter',
      location: 'New York',
      imagePath: CommonAssets.soldierswipeImage,
      verifiedIconPath: CommonAssets.verifiedIcon,
      locationIconPath: CommonAssets.locationIcon,
    ),
    UserModel(
      id: 1,
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

  // Track liked and disliked users
  List<UserModel> likedUsers = [];
  List<UserModel> dislikedUsers = [];

  // Method to like a user (swipe right)
  void likeUser(UserModel user) {
    if (!likedUsers.contains(user)) {
      likedUsers.add(user);
    }
    users.remove(user); // Remove the user from the card stack after liking
    update(); // Notify listeners
  }

  // Method to dislike a user (swipe left)
  void dislikeUser(UserModel user) {
    if (!dislikedUsers.contains(user)) {
      dislikedUsers.add(user);
    }
    users.remove(user); // Remove the user from the card stack after disliking
    update(); // Notify listeners
  }

  // Method to change bottom navigation index
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
