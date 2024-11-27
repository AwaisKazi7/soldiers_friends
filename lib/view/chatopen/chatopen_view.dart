import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/imagepicker_bottomSheet.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:soldiers_friends/view/chatopen/chatopen_cotroller.dart';

class ChatOpenScreen extends StatelessWidget {
  const ChatOpenScreen({super.key, required this.userData});

  final FriendsModel userData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailController>(builder: (controller) {
      return Scaffold(
        appBar: ChatDetailAppBar(
          backIcon: AssetImage(CommonAssets.backarrowIcon),
          user: userData,
          userImage: userData.isDelete == 1
              ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
              : userData.isblocked == 1
                  ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                  : userData.images.isNotEmpty
                      ? userData.images.last
                      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
          username: userData.isDelete == 1
              ? 'Deleted User'
              : userData.isblocked == 1
                  ? 'Blocked User'
                  : userData.name,
          subtitle: 'Your friend today!',
          threeDotIcon: AssetImage(CommonAssets.threedotsIcon),
        ),
        body: Column(
          children: [
            Visibility(
              visible: true,
              //  controller.messagesList.isNotEmpty,
              replacement: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
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
                    SizedBox(
                      height: 20.sp,
                    ),
                    Container(
                      height: 100.sp,
                      width: 100.sp,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/images/wave.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CommonButton(
                      text: 'Say Hi',
                      onPressed: () {},
                      gradient: CommonColors.buttonGradient,
                      width: 100.sp,
                    )
                  ],
                ),
              ),
              child: Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: controller.getMessages(userData.chatId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SmallLoader();
                    } else {
                      final messages = snapshot.data!;
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return ChatBubble(
                              Userimage: userData.images.isNotEmpty
                                  ? userData.images.last
                                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                              text: message['content'],
                              isSentByUser: message['sender_id'] ==
                                      int.parse(
                                          LocalDataStorage.currentUserId.value)
                                  ? true
                                  : false,
                              time: '08:10 pm',
                              isSeen: true);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            Visibility(
              visible: userData.isDelete == 0,
              replacement: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.sp)),
                  padding: EdgeInsets.all(20.sp),
                  child: Center(child: Text('This Account is deleted')),
                ),
              ),
              child: Visibility(
                visible: userData.isblocked == 0,
                replacement: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.sp)),
                    padding: EdgeInsets.all(20.sp),
                    child: Center(child: Text('This user is blocked')),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Visibility(
                      //   visible:
                      //       controller.controllersProvider.imagePath.value == '',
                      // replacement: Expanded(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         border: Border.all(color: Colors.black, width: 1.sp),
                      //         borderRadius: BorderRadius.circular(20.sp)),
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 10.sp, vertical: 10.sp),
                      //       child: Container(
                      //         height: 80.sp,
                      //         width: 100.sp,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           border:
                      //               Border.all(color: Colors.black, width: 1.sp),
                      //           borderRadius: BorderRadius.circular(20.sp),
                      //           image: DecorationImage(
                      //             alignment: Alignment.topLeft,
                      //             fit: BoxFit.cover,
                      //             image: FileImage(
                      //               File(controller
                      //                   .controllersProvider.imagePath.value),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // child:
                      Expanded(
                        child: TextField(
                          controller: controller.messagecontroller,
                          decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // IconButton(
                                  //   iconSize: 20,
                                  //   icon: Icon(
                                  //     Icons.image,
                                  //     color:
                                  //         Colors.grey, // Set icon color to grey
                                  //   ),
                                  //   onPressed: () {
                                  //     ImagePickerBottomSheet.show(context);
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                            hintText: 'Write your message here',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(
                                    0.5), // Set border color to grey
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                      // ),

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
                              if (controller.messagecontroller.text != '') {
                                await controller.sendMessage(
                                    userData.id, 0, userData.chatId);
                              } else {}

                              // await controller.GetMessage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
  final String Userimage;

  ChatBubble({
    required this.text,
    required this.isSentByUser,
    required this.time,
    required this.isSeen,
    required this.Userimage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByUser)
            CircleAvatar(
              child: ClipOval(
                  child: ImageWidget(
                imageUrl: Userimage,
                height: 100.sp,
                width: 100.sp,
              )),
            ),
          SizedBox(width: 8.0),
          Column(
            children: [
              SizedBox(
                height: 5.sp,
              ),
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
                    topLeft: isSentByUser
                        ? Radius.circular(16.0)
                        : Radius.circular(0.0),
                    topRight: isSentByUser
                        ? Radius.circular(0.0)
                        : Radius.circular(16.0),
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
            ],
          ),
          if (isSentByUser) SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
