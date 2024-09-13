import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/swipe_profile/swipe_profile_controller.dart';
import 'package:soldiers_friends/view/swipe_profile/swipe_widgets/swipe_card_widget.dart';

class SwipeProfileView extends StatelessWidget {
  const SwipeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwipeProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: CommonColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: CommonColors.backgroundColor,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: CommonColors.blackColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    CommonAssets.soldierprofileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Center(
              child: CommonText(
                text: 'Soldiers Friends',
                style: CommonTextStyle.gradienttext.copyWith(fontSize: 24),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: CommonColors.gradientEndColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      CommonAssets.bellIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CommonText(
                          text: 'Find New Friends',
                          style: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          itemCount: controller.swipeItems.length,
                          itemBuilder: (context, index) {
                            final swipeItem = controller.swipeItems[index];
                            return SwipeCardWidget(
                              swipeItem: swipeItem,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
