import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_cotroller.dart';

class ChatOpenScreen extends StatelessWidget {
  const ChatOpenScreen({super.key, required this.userData});

  final homeModel userData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailController>(builder: (controller) {
      return Scaffold(
        appBar: ChatDetailAppBar(
          backIcon: AssetImage(CommonAssets.backarrowIcon),
          userImage: userData.images.isNotEmpty
              ? userData.images.last
              : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
          username: userData.name,
          subtitle: 'Your friend today!',
          threeDotIcon: AssetImage(CommonAssets.threedotsIcon),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CommonColors.lightGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: '${userData.name} is waiting for a message',
                    style: CommonTextStyle.splashheadline1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: 'from you!',
                        textAlign: TextAlign.center,
                        style: CommonTextStyle.splashheadline1,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView(
                  reverse: true,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  children: controller.messagesList
                      .map(
                        (element) => ChatBubble(
                          text: element.content,
                          isSentByUser: false,
                          time: '8:41 AM',
                          isSeen: true,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.messagecontroller,
                      decoration: InputDecoration(
                        suffixIcon: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                iconSize: 20,
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey, // Set icon color to grey
                                ),
                                onPressed: () {
                                  // Handle camera functionality
                                },
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: Icon(
                                  Icons.image,
                                  color: Colors.grey, // Set icon color to grey
                                ),
                                onPressed: () {
                                  // Handle image selection
                                },
                              ),
                            ],
                          ),
                        ),
                        hintText: 'Write your message here',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey
                                .withOpacity(0.5), // Set border color to grey
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          CommonColors.gradientStartColor,
                          CommonColors.gradientEndColor
                        ])),
                    child: Obx(
                      () => IconButton(
                        color: Colors.white,
                        icon: controller.apihitting.value
                            ? SizedBox(
                                height: 10.sp,
                                width: 10.sp,
                                child: CircularProgressIndicator())
                            : Icon(Icons.send),
                        onPressed: () async {
                          // Send the message
                          await controller.sendMessage(userData.id, 0);
                          await controller.GetMessage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByUser;
  final String time;
  final bool isSeen;

  ChatBubble({
    required this.text,
    required this.isSentByUser,
    required this.time,
    required this.isSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByUser)
            CircleAvatar(
              backgroundImage: AssetImage(
                  CommonAssets.chatuserImage), // Replace with actual image
            ),
          SizedBox(width: 8.0),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              // gradient: !isSentByUser
              //     ? LinearGradient(
              //         colors: [
              //           CommonColors.gradientStartColor,
              //           CommonColors.gradientEndColor
              //         ],
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //       )
              //     : null,
              color: !isSentByUser
                  ? CommonColors.gradientStartColor
                  : CommonColors.gradientEndColor,
              borderRadius: BorderRadius.only(
                topLeft:
                    isSentByUser ? Radius.circular(16.0) : Radius.circular(0.0),
                topRight:
                    isSentByUser ? Radius.circular(0.0) : Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: isSentByUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: isSentByUser ? Colors.white : Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12.0,
                  ),
                ),
                if (!isSentByUser && isSeen)
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                    size: 16.0,
                  )
              ],
            ),
          ),
          if (isSentByUser) SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
