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
            // decoration: BoxDecoration(
            //   color: CommonColors.backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            // ),
            child: BottomNavigationBar(
              onTap: controller.onTabTapped,
              currentIndex: controller.selectedIndex,

              backgroundColor:
                  Colors.white, // Background color for the BottomNavigationBar
              selectedItemColor: CommonColors.darkGreen, // Selected item color
              unselectedItemColor: Colors.grey, // Unselected item color
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              iconSize: 32, // Size of icons
              type: BottomNavigationBarType.fixed,
              items: [
                buildNavBarItem(
                  iconPath: CommonAssets.homeImage,
                  label: 'Home',
                  isSelected: controller.selectedIndex == 0,
                  selectedColor: CommonColors.primaryColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.heartImage,
                  label: 'Matches',
                  isSelected: controller.selectedIndex == 1,
                  selectedColor: CommonColors.primaryColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.chatImage,
                  label: 'Chat',
                  isSelected: controller.selectedIndex == 2,
                  selectedColor: CommonColors.primaryColor,
                ),
                buildNavBarItem(
                  iconPath: CommonAssets.profilenavImage,
                  label: 'Profile',
                  isSelected: controller.selectedIndex == 3,
                  selectedColor: CommonColors.primaryColor,
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
              isSelected ? selectedColor.withOpacity(0.1) : Colors.transparent,
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
// BottomNavigationBarItem buildNavItem(
//   BuildContext context,
//   HomeController controller,
//   int index,
//   String assetPath,
//   String label,
//   bool isSelected,
// ) {
//   return Expanded(
//     child: GestureDetector(
//       onTap: () => controller.changeIndex(index),
//       child: Container(
//         decoration: BoxDecoration(
//           color: controller.selectedIndex == index
//               ? CommonColors.lightGray
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               assetPath,
//               color: isSelected
//                   ? CommonColors.darkGreen
//                   : CommonColors.gradientEndColor,
//               height: 28.0,
//             ),
//             const SizedBox(height: 4.0),
//             Flexible(
//               child: Align(
//                 alignment: Alignment.center,
//                 child: CommonText(
//                   text: label,
//                   style: CommonTextStyle.splashheadline1.copyWith(
//                     color: isSelected
//                         ? CommonColors.darkGreen
//                         : CommonColors.neutralGray,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
}
