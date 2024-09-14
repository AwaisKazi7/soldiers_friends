import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/swipe_profile/home_controller.dart';
import 'package:soldiers_friends/view/swipe_profile/swipe_widgets/user_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // Initialize the controller
      builder: (controller) => Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CommonColors.backgroundColor,
          leading: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(CommonAssets.soldierprofileImage),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: CommonColors.gradientStartColor,
                width: 4.0,
              ),
            ),
          ),
          title: CommonText(
            text: 'Soldiers Friends',
            style: CommonTextStyle.gradienttext.copyWith(fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(CommonAssets.soldierprofileImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: CommonColors.gradientStartColor,
                    width: 4.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CommonText(
              text: 'Find New Profiles',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return UserCard(user: user);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CommonColors.blackColor,

          ///START WORKING ON IT
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
