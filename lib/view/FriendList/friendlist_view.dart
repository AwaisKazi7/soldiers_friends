import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/FriendList/friend_widget/friend_card.dart';
import 'package:soldiers_friends/view/FriendList/friendlist_controller.dart';
import 'package:soldiers_friends/view/likes/likes_widgets/likes_card.dart';

class FriendListView extends StatelessWidget {
  const FriendListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendListController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: CommonColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: CommonColors.backgroundColor,
            surfaceTintColor: CommonColors.backgroundColor,
            title: CommonText(
              text: 'Friend List',
              style: CommonTextStyle.splashheadline1
                  .copyWith(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Obx(
                    () => Expanded(
                        child: controller.friendloading.value
                            ? SmallLoader()
                            : controller.FriendsList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text('No Friends Added Yet..'),
                                      )
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
                                    itemCount: controller.FriendsList.length,
                                    itemBuilder: (context, index) {
                                      FriendsModel Data =
                                          controller.FriendsList[index];
                                      return FriendCard(
                                        Data: Data,
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesName.frienddetailview,
                                              arguments: Data);
                                        },
                                        verifiedIconPath:
                                            CommonAssets.verifiedIcon,
                                      );
                                    },
                                  )),
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
