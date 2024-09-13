import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/model/swipe_model.dart';

class SwipeProfileController extends GetxController {
  // List of swipe items
  List<SwipeItemModel> swipeItems = [
    SwipeItemModel(
      name: 'Mark Peter',
      // imagePath: 'assets/background_images/szabo-viktor.jpg',
      imagePath: CommonAssets.soldierswipeImage, location: 'New York',
    ),
    SwipeItemModel(
      name: 'Ryan',
      // imagePath: 'assets/background_images/ryan-jacobson.jpg',
      imagePath: CommonAssets.soldierswipeImage, location: 'Karachi',
    ),
    SwipeItemModel(
      name: 'Daria',
      // imagePath: 'assets/background_images/the-paris.jpg',
      imagePath: CommonAssets.soldierswipeImage, location: 'Moscow',
    ),
  ];

  @override
  void onReady() {
    super.onReady();
    // Optionally add any setup logic here if needed
  }

  // Method to get the swipe items
  // List<SwipeItemModel> getSwipeItems() => swipeItems;
}
