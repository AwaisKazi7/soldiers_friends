import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_controller.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (controller) {
        return Scaffold(
          body: controller.screens[controller.selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            child: BottomNavigationBar(
              onTap: controller.onTabTapped,
              currentIndex: controller.selectedIndex,
              backgroundColor: CommonColors.backgroundColor,
              selectedItemColor: CommonColors.darkGreen,
              unselectedItemColor: CommonColors.gradientEndColor,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              iconSize: 32,
              type: BottomNavigationBarType.fixed,
              items: [
                buildNavBarItem(
                  iconPath: CommonAssets.homeImage,
                  label: 'Home',
                  isSelected: controller.selectedIndex == 0,
                  selectedColor: CommonColors.gradientEndColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.heartImage,
                  label: 'Likes',
                  isSelected: controller.selectedIndex == 1,
                  selectedColor: CommonColors.gradientEndColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.chatImage,
                  label: 'Chats',
                  isSelected: controller.selectedIndex == 2,
                  selectedColor: CommonColors.gradientEndColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.profilenavImage,
                  label: 'Profile',
                  isSelected: controller.selectedIndex == 3,
                  selectedColor: CommonColors.gradientEndColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem buildNavBarItem({
    required String iconPath,
    required String label,
    required bool isSelected,
    required Color selectedColor,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isSelected ? selectedColor.withOpacity(0.4) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          iconPath,
          color: isSelected ? selectedColor : Colors.green,
          fit: BoxFit.contain,
        ),
      ),
      label: label,
    );
  }
}
