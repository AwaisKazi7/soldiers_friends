import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find();

    return Container(
      decoration: BoxDecoration(
        color: CommonColors.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: Obx(() => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeIndex,
              backgroundColor: CommonColors.backgroundColor,
              selectedItemColor: CommonColors.blackColor,
              unselectedItemColor: CommonColors.blackColor,
              items: [
                _buildNavBarItem(
                  context,
                  CommonAssets.homeImage,
                  'Home',
                  controller.currentIndex.value == 0,
                  CommonColors.neutralGray,
                ),
                _buildNavBarItem(
                  context,
                  CommonAssets.heartImage,
                  'Matches',
                  controller.currentIndex.value == 1,
                  CommonColors.neutralGray,
                ),
                _buildNavBarItem(
                  context,
                  CommonAssets.chatImage,
                  'Message',
                  controller.currentIndex.value == 2,
                  CommonColors.neutralGray,
                ),
                _buildNavBarItem(
                  context,
                  CommonAssets.profilenavImage,
                  'Wishlist',
                  controller.currentIndex.value == 3,
                  CommonColors.neutralGray,
                ),
              ],
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              selectedLabelStyle: CommonTextStyle.splashheadline1,
              unselectedLabelStyle: CommonTextStyle.splashheadline1,
            )),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
    BuildContext context,
    String iconPath,
    String label,
    bool isSelected,
    Color selectedColor,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          iconPath,
          fit: BoxFit.contain,
        ),
      ),
      label: label,
    );
  }
}
