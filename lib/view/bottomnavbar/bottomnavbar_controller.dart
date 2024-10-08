import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/view/chat/chat_controller.dart';
import 'package:soldiers_friends/view/chat/chat_view.dart';
import 'package:soldiers_friends/view/home/home_controller.dart';
import 'package:soldiers_friends/view/home/home_view.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_controller.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_view.dart';
import 'package:soldiers_friends/view/likes/likes_controller.dart';
import 'package:soldiers_friends/view/likes/likes_view.dart';

class NavbarController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    onTabTapped(0);
  }

  final List<Widget> screens = [
    const HomeView(),
    const LikesView(),
    const ChatView(),
    const EditProfileView(),
  ];
  int selectedIndex = 0;

  onTabTapped(int index) async {
    selectedIndex = index;

    update();
    switch (selectedIndex) {
      case 0:
        return await Get.put<HomeController>(HomeController());
      case 1:
        return await Get.put<LikesController>(LikesController());
      case 2:
        return await Get.put<ChatViewController>(ChatViewController());
      case 3:
        return await Get.put<EditProfileController>(EditProfileController());
      //For Profile

      default:
        return await Get.put<HomeController>(HomeController());
    }
  }
}
