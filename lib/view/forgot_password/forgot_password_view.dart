import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/forgot_password/forget_widgets.dart/otp_verification.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(18.0),
          height: context.height,
          width: context.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(CommonAssets.rankImage),
                const SizedBox(
                  height: 20,
                ),
                CommonText(
                  text: "Forgot Password?",
                  style: CommonTextStyle.splashheadline1
                      .copyWith(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                CommonText(
                  text: 'No worries, we’ll send you reset instructions',
                  style: CommonTextStyle.splashheadline1.copyWith(fontSize: 20),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextform(
                    textStyle: CommonTextStyle.splashheadline1,
                    hintText: "Email",
                    borderRadius: 5,
                    controller: TextEditingController()),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommonButton(
                    height: 50.98,
                    width: 133.28,
                    text: 'Send Code',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    borderRadius: 5,
                    onPressed: () => Get.to(() => OtpVerification()),
                    boxShadow: const [],
                  ),
                ),
                const SizedBox(),
              ]),
        ),
      ),
    );
  }
}
