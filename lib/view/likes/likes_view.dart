import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/view/likes/likes_controller.dart';
import 'package:soldiers_friends/view/likes/likes_widgets/likes_card.dart';

class LikesView extends StatelessWidget {
  const LikesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LikesController>(
      initState: (state) {
        Get.find<LikesController>().onReady();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: CommonColors.backgroundColor,
          body: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                      child: CommonText(
                    text: 'Likes',
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w600),
                  )),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: CommonColors.lightGray,
                    ),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CommonButton(
                              // width: 180,
                              text: 'My Likes',
                              textStyle: CommonTextStyle.splashheadline1
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                              borderRadius: 24,
                              onPressed: () {
                                controller.toggleLikes(0);
                              },
                              boxShadow: const [],
                              gradient: controller.Likestab_Index == 0
                                  ? CommonColors.buttonGradient
                                  : null,
                              backgroundColor: controller.Likestab_Index == 0
                                  ? Colors.transparent
                                  : CommonColors.lightGray,
                              textColor: controller.Likestab_Index == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Expanded(
                            child: CommonButton(
                              // width: 180,
                              text: 'Likes Me',
                              textStyle: CommonTextStyle.splashheadline1
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                              borderRadius: 24,
                              onPressed: () {
                                controller.toggleLikes(1);
                              },
                              boxShadow: const [],
                              gradient: controller.Likestab_Index == 1
                                  ? CommonColors.buttonGradient
                                  : null,
                              backgroundColor: controller.Likestab_Index == 1
                                  ? Colors.transparent
                                  : CommonColors.lightGray,
                              textColor: controller.Likestab_Index == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child:
                        // controller.currentLikesList.isEmpty
                        //     ? Center(
                        //         child: CommonText(
                        //           text: "No More Data",
                        //           style: CommonTextStyle.splashheadline1.copyWith(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w600,
                        //             color: Colors.grey,
                        //           ),
                        //         ),
                        //       )
                        //     :
                        Column(
                      children: [
                        Obx(
                          () => controller.loading.value
                              ? SmallLoader()
                              : Expanded(
                                  child: controller.Likestab_Index == 0
                                      ? controller.myLikesList.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                    child:
                                                        Text('No likes users '))
                                              ],
                                            )
                                          : GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.65,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                              ),
                                              itemCount:
                                                  controller.myLikesList.length,
                                              itemBuilder: (context, index) {
                                                homeModel Data = controller
                                                    .myLikesList[index];
                                                return LikeCard(
                                                  Data: Data,
                                                  onTap: () {
                                                    controller.navigateToDetail(
                                                        Data, 0);
                                                  },
                                                  verifiedIconPath:
                                                      CommonAssets.verifiedIcon,
                                                );
                                              },
                                            )
                                      : controller.likesMeList.isEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                    child:
                                                        Text('No likes users '))
                                              ],
                                            )
                                          : GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.65,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                              ),
                                              itemCount:
                                                  controller.likesMeList.length,
                                              itemBuilder: (context, index) {
                                                homeModel Data = controller
                                                    .likesMeList[index];
                                                return LikeCard(
                                                  Data: Data,
                                                  onTap: () {
                                                    controller.navigateToDetail(
                                                        Data, 1);
                                                  },
                                                  verifiedIconPath:
                                                      CommonAssets.verifiedIcon,
                                                );
                                              },
                                            ),
                                ),
                        ),
                        // const SizedBox(
                        //     height:
                        //         20), // Some space before "No More Data"
                        // CommonText(
                        //   text: "No More Data",
                        //   style: CommonTextStyle.splashheadline1.copyWith(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.grey,
                        //   ),
                        // ),
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
