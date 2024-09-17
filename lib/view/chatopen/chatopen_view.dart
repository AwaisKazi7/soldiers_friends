import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatDetailAppBar(
        backIcon: AssetImage(CommonAssets.backarrowIcon),
        userImage: AssetImage(CommonAssets.chatuserImage),
        username: 'Jennifer',
        subtitle: 'Your friend today!',
        threeDotIcon: AssetImage(CommonAssets.threedotsIcon),
      ),
      body: Container(
        margin: const EdgeInsets.all(18.0),
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CommonColors.lightGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: 'Jennifer is waiting for a message',
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
            )
          ],
        ),
      ),
    );
  }
}
