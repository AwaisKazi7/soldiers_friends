import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/common/smallloader.dart';
import 'package:soldiers_friends/commonwidgets/common_app_bar.dart';
import 'package:soldiers_friends/model/friendModel.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:soldiers_friends/view/chat/chat_controller.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatViewController>(
      initState: (state) {
        Get.find<ChatViewController>().onReady();
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CommonColors.backgroundColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 20.sp,
                    child: ClipOval(
                      child: ImageWidget(
                        imageUrl: LocalDataStorage.userImage.value != ''
                            ? LocalDataStorage.userImage.value
                            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        width: 50.sp,
                      ),
                    ),
                  ),
                  radius: 24.sp,
                ),
                Obx(
                  () => Visibility(
                    visible: controller.showsearch.value == true,
                    child: Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: CommonTextform(
                          textStyle: CommonTextStyle.splashheadline1,
                          hintText: "Saerch",
                          fillColor: CommonColors.backgroundColor,
                          onChanged: (value) {
                            controller.filterConversations(value);
                          },
                          controller: controller.saerchController,
                          isUnderline: false,
                          borderColor: CommonColors.blackColor.withOpacity(0.1),
                          borderRadius: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.showsearch.value == false,
                    child: GestureDetector(
                      onTap: () {
                        controller.showsearch.value =
                            !controller.showsearch.value;
                      },
                      child: Icon(
                        Icons.search,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                    replacement: GestureDetector(
                      onTap: () {
                        controller.showsearch.value =
                            !controller.showsearch.value;
                        controller.filterConversations('');
                        controller.saerchController.clear();
                      },
                      child: Icon(
                        Icons.close,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          backgroundColor: CommonColors.backgroundColor,
          body: Container(
            margin: const EdgeInsets.all(8.0),
            height: context.height,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CommonText(
                  text: 'Chats',
                  style: CommonTextStyle.splashheadline1.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Visibility(
                    visible: controller.conversationList.isNotEmpty,
                    //  controller.messagesList.isNotEmpty,
                    replacement: controller.friendloading.value
                        ? SmallLoader()
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'No Conversation.',
                                  ),
                                )
                              ],
                            ),
                          ),
                    child: controller.filteredList.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                            itemCount: controller.filteredList.length,
                            separatorBuilder: (context, index) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: CommonColors.neutralGray.withOpacity(0.5),
                            ),
                            itemBuilder: (context, index) {
                              FriendsModel data =
                                  controller.filteredList[index];
                              return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Stack(
                                    children: [
                                      CircleAvatar(
                                        child: ClipOval(
                                          child: ImageWidget(
                                              width: 100.sp,
                                              imageUrl: data.images.isEmpty
                                                  ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                                                  : data.images.last),
                                        ),
                                        radius: 25,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: CommonColors.dotColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: CommonText(
                                          text: data.name,
                                          style: CommonTextStyle.splashheadline1
                                              .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: CommonText(
                                    text: data.lastMessage,
                                    style: CommonTextStyle.splashheadline1
                                        .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: CommonColors.neutralGray,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(RoutesName.chatdetails,
                                        arguments: data);
                                  });
                            },
                          ))
                        : Expanded(
                            child: ListView.separated(
                            itemCount: controller.conversationList.length,
                            separatorBuilder: (context, index) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: CommonColors.neutralGray.withOpacity(0.5),
                            ),
                            itemBuilder: (context, index) {
                              FriendsModel data =
                                  controller.conversationList[index];
                              return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Stack(
                                    children: [
                                      CircleAvatar(
                                        child: ClipOval(
                                          child: ImageWidget(
                                              width: 100.sp,
                                              imageUrl: data.images.isEmpty
                                                  ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                                                  : data.images.last),
                                        ),
                                        radius: 25,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: CommonColors.dotColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: CommonText(
                                          text: data.name,
                                          style: CommonTextStyle.splashheadline1
                                              .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 8.0, vertical: 2.0),
                                      //   constraints: const BoxConstraints(
                                      //     minWidth: 24.0,
                                      //     minHeight: 24.0,
                                      //   ),
                                      //   decoration: const BoxDecoration(
                                      //     color: Colors.red,
                                      //     shape: BoxShape.circle,
                                      //   ),
                                      //   child: Center(
                                      //     child: CommonText(
                                      //       text: data.name,
                                      //       style: CommonTextStyle.splashheadline1
                                      //           .copyWith(
                                      //         color: Colors.white,
                                      //         fontSize: 15,
                                      //         fontWeight: FontWeight.w500,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  subtitle: CommonText(
                                    text: data.lastMessage,
                                    style: CommonTextStyle.splashheadline1
                                        .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: CommonColors.neutralGray,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(RoutesName.chatdetails,
                                        arguments: data);
                                  });
                            },
                          )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
