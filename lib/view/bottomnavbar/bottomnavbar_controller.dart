import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  // Index of the selected item
  var selectedIndex = 0;

  // Update the selected item
  void updateIndex(int index) {
    selectedIndex = index;
    update(); // Notify listeners
  }
}
