import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/FriendList/friend_widget/friend_card.dart';
import 'package:soldiers_friends/view/blocklist/blocklist_controller.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_cotroller.dart';

class blockListView extends StatelessWidget {
  const blockListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockListController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: CommonColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: CommonColors.backgroundColor,
            surfaceTintColor: CommonColors.backgroundColor,
            title: CommonText(
              text: 'Block List',
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
                        child: controller.loading.value
                            ? SmallLoader()
                            : controller.blockList.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text('No User Added Yet..'),
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
                                    itemCount: controller.blockList.length,
                                    itemBuilder: (context, index) {
                                      FriendsModel Data =
                                          controller.blockList[index];
                                      return FriendCard(
                                        Data: Data,
                                        onTap: () {
                                          
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Dialog(
                                                        backgroundColor:
                                                            CommonColors
                                                                .backgroundColor,
                                                        child: Container(
                                                          height: 200,
                                                          width: 300,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 50,
                                                                  ),
                                                                  Text(
                                                                    'Unblock this User',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Are you sure you want to unblock \nthis user?',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    // mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                      Obx(
                                                                        () => CommonButton(
                                                                            height: 30,
                                                                            width: 100,
                                                                            text: 'Yes',
                                                                            isloading: Get.find<ChatDetailController>().Blockloading.value,
                                                                            textStyle: CommonTextStyle.splashheadline1.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                                                                            borderRadius: 5,
                                                                            boxShadow: const [],
                                                                            onPressed: () async {
                                                                              await Get.find<ChatDetailController>().blockAccount(context, Data.chatId,0);
                                                                            }),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      CommonButton(
                                                                          height:
                                                                              30,
                                                                          width:
                                                                              100,
                                                                          text:
                                                                              'No',
                                                                          textStyle: CommonTextStyle.splashheadline1.copyWith(
                                                                              fontSize:
                                                                                  16,
                                                                              fontWeight: FontWeight
                                                                                  .w500),
                                                                          borderRadius:
                                                                              5,
                                                                          boxShadow: const [],
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          }),
                                                                    ],
                                                                  )
                                                                ]),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                               
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
