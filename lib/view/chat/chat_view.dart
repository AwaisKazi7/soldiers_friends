import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/commonwidgets/common_app_bar.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/bottomnavbar/bottomnavbar_view.dart';
import 'package:soldiers_friends/view/chat/chat_controller.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatViewController>(
      init: ChatViewController(),
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBar(
            appBarColor: CommonColors.backgroundColor,
            centerText: '',
            firstImage: AssetImage(CommonAssets.soldierprofileImage),
            secondImage: AssetImage(CommonAssets.searchIcon),
            textStyle: CommonTextStyle.commonButtonStyle,
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
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.chats.length,
                    separatorBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: CommonColors.neutralGray.withOpacity(0.5),
                    ),
                    itemBuilder: (context, index) {
                      final chat = controller.chats[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Stack(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage(CommonAssets.chatuserImage),
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
                                text: chat.name,
                                style: CommonTextStyle.splashheadline1.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              constraints: const BoxConstraints(
                                minWidth: 24.0,
                                minHeight: 24.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: CommonText(
                                  text: '${chat.messageCount}',
                                  style:
                                      CommonTextStyle.splashheadline1.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: CommonText(
                          text: chat.lastMessage,
                          style: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: CommonColors.neutralGray,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.chatdetails);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavbar(),
        );
      },
    );
  }
}
