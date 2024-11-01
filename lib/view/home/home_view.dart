import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/commonwidgets/common_app_bar.dart';
import 'package:soldiers_friends/view/home/home_controller.dart';
import 'package:soldiers_friends/view/home/home_widgets/user_card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            appBarColor: CommonColors.backgroundColor,
            centerText: 'Soldiers Friends',
            firstImage: const AssetImage(CommonAssets.soldierprofileImage),
            secondImage: const AssetImage(CommonAssets.bellIcon),
            textStyle: CommonTextStyle.gradienttext
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          backgroundColor: CommonColors.backgroundColor,
          body: RefreshIndicator(
            onRefresh: () async {
              await controller.getHomeData();
            },
            child: SafeArea(
              child: Obx(
                () => controller.loadingHome.value
                    ? SmallLoader()
                    : controller.UsersList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('No Users Found'),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  CommonText(
                                    // textAlign: TextAlign.end,
                                    text: 'Discover New Friend\'s',
                                    style: CommonTextStyle.welcomelogin
                                        .copyWith(fontSize: 28),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    child: Obx(() => CardSwiper(
                                          numberOfCardsDisplayed: 2,
                                          cardsCount:
                                              controller.UsersList.length,
                                          controller: controller.cardController,
                                          onSwipe: (previousIndex, currentIndex,
                                              direction) {
                                            if (currentIndex != null &&
                                                currentIndex <
                                                    controller
                                                        .UsersList.length) {
                                              final user = controller
                                                  .UsersList[previousIndex];
                                              if (direction ==
                                                  CardSwiperDirection.left) {
                                                controller.dislikeUser(user);
                                              } else if (direction ==
                                                  CardSwiperDirection.right) {
                                                controller.likeUser(
                                                    context, user);
                                              }
                                            }
                                            return true;
                                          },
                                          cardBuilder: (context,
                                              index,
                                              percentThresholdX,
                                              percentThresholdY) {
                                            return UserCard(
                                                user: controller
                                                    .UsersList[index]);
                                          },
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FloatingActionButton(
                                        elevation: 0.6,
                                        heroTag: null,
                                        onPressed: () {
                                          // controller.cardController.moveTo(index);
                                          controller.cardController
                                              .swipe(CardSwiperDirection.left);
                                        },
                                        backgroundColor:
                                            CommonColors.gradientStartColor,
                                        child: Icon(
                                          Icons.cancel_sharp,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    FloatingActionButton(
                                      elevation: 0.6,
                                      heroTag: null,
                                      onPressed: () {
                                        controller.cardController
                                            .swipe(CardSwiperDirection.right);
                                        // controller.likeUser(user);
                                      },
                                      backgroundColor:
                                          CommonColors.gradientEndColor,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        // CommonAssets.handphoneImage,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
              ),
            ),
          ),
        );
      },
    );
  }
}
