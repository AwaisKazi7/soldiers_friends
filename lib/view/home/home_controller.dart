import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/home_model.dart';
import 'package:soldiers_friends/services/SupabaseDB.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/home/home_view.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    cardController;
    await getHomeData();
  }

  RxList<homeModel> UsersList = <homeModel>[].obs;
  RxBool loadingHome = false.obs;
  getHomeData() async {
    loadingHome.value = true;
    var data = await supabse_DB.getInstance.GetAllUser(); // Await the Future

    if (data != null && data.isNotEmpty) {
      UsersList.addAll(data);
      loadingHome.value = false;
    } else {
      print('No users found');
    }
  }

  CardController cardController = CardController();

  // Index for the BottomNavigationBar
  int selectedIndex = 0;

  RxList<homeModel> likedUsers = <homeModel>[].obs;
  RxList<homeModel> dislikedUsers = <homeModel>[].obs;

  // Method to like a user (swipe right)
  void likeUser(homeModel user) {
    if (!likedUsers.contains(user)) {
      likedUsers.add(user);
    }
    // UsersList.remove(user); // Remove the user from the card stack after liking
    // update(); // Notify listeners
  }

  // Method to dislike a user (swipe left)
  void dislikeUser(homeModel user) {
    if (!dislikedUsers.contains(user)) {
      dislikedUsers.add(user);
    }
    // UsersList.remove(user);
    // update();
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
