import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/custom_bottom_sheet.dart';
import 'package:soldiers_friends/view/login/login_view.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          height: context.height,
          width: context.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(CommonAssets.rankImage),
                    CommonText(
                      text: "Reset Password",
                      style: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                    CommonText(
                      text: "Enter New Password",
                      style: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 20),
                      maxLines: 2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.7,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                          textStyle: CommonTextStyle.splashheadline1,
                          hintText: "New Password",
                          fillColor: CommonColors.backgroundColor,
                          borderColor: Colors.transparent,
                          controller: TextEditingController()),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.7,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                          textStyle: CommonTextStyle.splashheadline1,
                          hintText: "Confirm Password",
                          fillColor: CommonColors.backgroundColor,
                          borderColor: Colors.transparent,
                          controller: TextEditingController()),
                    ),
                  ],
                ),
                Center(
                  child: CommonButton(
                    height: 50.98,
                    width: 345.59,
                    text: 'Reset Password',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    borderRadius: 5,
                    textColor: CommonColors.backgroundColor,
                    onPressed: () => showCustomBottomSheet(context),
                    boxShadow: const [],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () => Get.to(() => LoginPage()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back),
                        const SizedBox(width: 8.0),
                        CommonText(
                          text: 'Back to log in',
                          style: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
