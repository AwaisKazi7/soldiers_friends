import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_cotroller.dart'; // Ensure this path is correct

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ImageProvider? backIcon;
  final String userImage;
  final String username;
  final String subtitle;
  final ImageProvider? threeDotIcon;
  final FriendsModel user;

  const ChatDetailAppBar({
    super.key,
    this.backIcon,
    required this.userImage,
    required this.username,
    required this.subtitle,
    this.threeDotIcon,
    required this.user,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const double borderWidth = 3.0;

    return AppBar(
      backgroundColor: CommonColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (backIcon != null)
            IconButton(
              icon: CircleAvatar(
                backgroundColor: CommonColors.lightGray,
                child: ClipOval(
                  child: Image(
                    image: backIcon!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          const SizedBox(width: 15),
          if (userImage != null)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CommonColors.gradientStartColor,
                  width: borderWidth,
                ),
              ),
              child: CircleAvatar(
                child: ClipOval(
                    child: ImageWidget(
                  imageUrl: userImage,
                  boxfit: BoxFit.cover,
                  height: 50,
                  width: 50,
                )),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  text: username,
                  style: CommonTextStyle.splashheadline1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                CommonText(
                  text: subtitle,
                  style: CommonTextStyle.splashheadline1
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (threeDotIcon != null)
            PopupMenuButton<String>(
              icon: CircleAvatar(
                backgroundColor: CommonColors.lightGray,
                child: ClipOval(
                  child: Image(
                    image: threeDotIcon!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onSelected: (value) {
                // Handle menu item selection
                switch (value) {
                  case 'Block':
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: CommonColors.backgroundColor,
                          child: Container(
                            height: 200,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Block this User',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Are you sure you want to block \nthis user?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Obx(
                                      () => CommonButton(
                                          height: 30,
                                          width: 100,
                                          text: 'Yes',
                                          isloading:
                                              Get.find<ChatDetailController>()
                                                  .Blockloading
                                                  .value,
                                          textStyle: CommonTextStyle
                                              .splashheadline1
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                          borderRadius: 5,
                                          boxShadow: const [],
                                          onPressed: () async {
                                            await Get.find<
                                                    ChatDetailController>()
                                                .blockAccount(context, user.id,
                                                    user.chatId, 1);
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CommonButton(
                                        height: 30,
                                        width: 100,
                                        text: 'No',
                                        textStyle: CommonTextStyle
                                            .splashheadline1
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                        borderRadius: 5,
                                        boxShadow: const [],
                                        onPressed: () {
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
                    break;
                  case 'Report':
                    // Handle Option 2
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Block',
                    child: Text('Block User'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Report',
                    child: Text('Report'),
                  ),
                ];
              },
            ),
        ],
      ),
      centerTitle: true,
    );
  }
}
