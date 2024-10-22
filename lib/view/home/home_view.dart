import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/smallloader.dart';
// import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/commonwidgets/common_app_bar.dart';
// import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
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
          body: SafeArea(
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
                                  child: Obx(
                                    () => SwipeCard(
                                      swipeEdgeVertical: 3.0,
                                      animDuration: 300,
                                      totalNum: controller.UsersList.length,
                                      stackNum: 2,
                                      swipeEdge: 0.5,
                                      allowVerticalMovement: false,
                                      maxWidth:
                                          MediaQuery.of(context).size.width * 1,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                      minHeight:
                                          MediaQuery.of(context).size.width +
                                              130 * 0.9,
                                      maxHeight:
                                          MediaQuery.of(context).size.width +
                                              120 * 0.99,
                                      cardBuilder: (context, index) {
                                        final user =
                                            controller.UsersList[index];
                                        return UserCard(user: user);
                                      },
                                      cardController: controller.cardController,
                                      swipeUpdateCallback:
                                          (DragUpdateDetails details,
                                              Alignment align) {
                                        // Get swiping card's alignment
                                        if (align.x > 0) {
                                          // Card is LEFT swiping
                                        } else if (align.x > 0) {
                                          // Card is RIGHT swiping
                                        }
                                      },
                                      swipeCompleteCallback:
                                          (CardSwipeOrientation orientation,
                                              int index) {
                                        final user =
                                            controller.UsersList[index];
                                        if (orientation ==
                                            CardSwipeOrientation.LEFT) {
                                          controller.dislikeUser(user);
                                        } else if (orientation ==
                                            CardSwipeOrientation.RIGHT) {
                                          controller.likeUser(user);
                                        }
                                      },
                                    ),
                                  ),
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
                                        controller.cardController.swipeLeft();
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
                                      controller.cardController.swipeRight();
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
        );
      },
    );
  }
}
