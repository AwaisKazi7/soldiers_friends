import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_password_controller.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/custom_bottom_sheet.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/otp_boxes.dart';
import 'package:soldiers_friends/view/login/login_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(CommonAssets.rankImage),
                const SizedBox(height: 20),
                CommonText(
                  text: "Forgot Password?",
                  style: CommonTextStyle.splashheadline1.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CommonText(
                  text: 'No worries, we’ll send you reset instructions',
                  style: CommonTextStyle.splashheadline1.copyWith(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CommonColors.blackColor.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: CommonTextform(
                    textStyle: CommonTextStyle.splashheadline1,
                    hintText: "Email",
                    fillColor: CommonColors.backgroundColor,
                    borderColor: Colors.transparent,
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommonButton(
                    height: 50.98,
                    width: 133.28,
                    text: 'Send OTP',

                    textStyle: CommonTextStyle.splashheadline1.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    borderRadius: 5,
                    // Send OTP to Email
                    onPressed: () {},
                    boxShadow: const [],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Enter OTP',
                      style: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    OtpContainer(onChanged: (v) {}),
                    const SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CommonColors.blackColor.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CommonTextform(
                        textStyle: CommonTextStyle.splashheadline1,
                        hintText: "New Password",
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CommonColors.blackColor.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CommonTextform(
                        textStyle: CommonTextStyle.splashheadline1,
                        hintText: "Confirm Password",
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: CommonButton(
                        height: 50.98,
                        width: 345.59,
                        text: 'Reset Password',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        borderRadius: 5,
                        onPressed: () => showCustomBottomSheet(context),
                        boxShadow: const [],
                      ),
                    ),
                    const SizedBox(height: 16),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
