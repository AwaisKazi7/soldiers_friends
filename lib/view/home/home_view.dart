import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/commonwidgets/common_app_bar.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/home/home_controller.dart';
import 'package:soldiers_friends/view/home/home_widgets/user_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(
              appBarColor: CommonColors.backgroundColor,
              centerText: 'Soldiers Friends',
              textStyle: CommonTextStyle.gradienttext
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
              firstImage: const AssetImage(CommonAssets.soldierprofileImage),
              secondImage: const AssetImage(CommonAssets.bellIcon),
            ),
            backgroundColor: CommonColors.backgroundColor,
            body: Container(
              margin: const EdgeInsets.all(8.0),
              height: context.height,
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: 'Find New Profiles',
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
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
            ),
            bottomNavigationBar: const CustomBottomNavbar(),
          );
        });
  }
}
