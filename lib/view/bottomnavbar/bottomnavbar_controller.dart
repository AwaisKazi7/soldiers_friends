import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }
}
