import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/home/home_controller.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          color: CommonColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(37.05)),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                controller,
                0,
                CommonAssets.homeImage,
                'Home',
                controller.selectedIndex == 0,
              ),
              _buildNavItem(
                context,
                controller,
                1,
                CommonAssets.heartImage,
                'Matches',
                controller.selectedIndex == 1,
              ),
              _buildNavItem(
                context,
                controller,
                2,
                CommonAssets.chatImage,
                'Chat',
                controller.selectedIndex == 2,
              ),
              _buildNavItem(
                context,
                controller,
                3,
                CommonAssets.profilenavImage,
                'Profile',
                controller.selectedIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    HomeController controller,
    int index,
    String assetPath,
    String label,
    bool isSelected,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: Container(
          decoration: BoxDecoration(
            color: controller.selectedIndex == index
                ? CommonColors.lightGray
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                assetPath,
                color: isSelected
                    ? CommonColors.darkGreen
                    : CommonColors.gradientEndColor,
                height: 28.0,
              ),
              const SizedBox(height: 4.0),
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: label,
                    style: CommonTextStyle.splashheadline1.copyWith(
                      color: isSelected
                          ? CommonColors.darkGreen
                          : CommonColors.neutralGray,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
