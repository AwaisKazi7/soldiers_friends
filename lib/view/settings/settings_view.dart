import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/view/settings/settings_controller.dart';
import 'package:soldiers_friends/view/settings/widget/setting_widget.dart';
import '../../common/common_colors.dart';
import '../../common/common_text.dart';
import '../../common/common_text_style.dart';
import '../../routes/routes_name_strings.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(12),
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                      color: CommonColors.blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 2),
                  CommonText(
                    text: "Back",
                    style: CommonTextStyle.loginAccountStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CommonText(
                text: 'Settings',
                style: CommonTextStyle.loginAccountStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              // buildAccountItemSettings(
              //   text: 'Language',
              //   onPressed: () {
              //     Get.toNamed(RoutesName.languagepage);
              //   },
              // ),
              // const SizedBox(height: 10),
              buildAccountItemSettings(
                text: 'Notification',
                switchValue: controller.isNotificationEnabled,
                onSwitchChanged: (value) {
                  // controller.toggleNotification(value);
                },
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              buildAccountItemSettings(
                text: 'Change Password',
                onPressed: () {
                  Get.toNamed(RoutesName.forgotpasswordpage);
                },
              ),
              const SizedBox(height: 10),
              buildAccountItemSettings(
                text: 'Delete Account',
                textStyle: TextStyle(
                  color: Colors.red,
                ),
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 16,
                ),
                onPressed: () async {
                  Get.toNamed(RoutesName.deleteview);
                },
              ),
              const SizedBox(height: 10),
              buildAccountItemSettings(
                text: 'Logout',
                textStyle: TextStyle(
                  color: Colors.red,
                ),
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 16,
                ),
                onPressed: () async {
                  await controller.Logout(context);
                },
              ),
            ],
          ),
        )),
      );
    });
  }
}
