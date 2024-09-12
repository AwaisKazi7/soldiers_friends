import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_rich_text.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/otp_boxes.dart';
import 'package:soldiers_friends/view/profile/profile_view.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newpassController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Image.asset(CommonAssets.backarrowIcon),
                    iconSize: 24,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(18.0),
                  height: context.height,
                  width: context.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(CommonAssets.lockphoneImage),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonText(
                        text: "OTP Verification",
                        style: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      CommonText(
                        text: "Enter your OTP code here",
                        style: CommonTextStyle.splashheadline1
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpContainer(onChanged: (v) {}),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(RoutesName.forgotpasswordpage),
                        child: CommonRichText(
                          text1: "Didn't you receive any code? ",
                          style1: CommonTextStyle.splashheadline1.copyWith(
                              color: CommonColors.blackColor, fontSize: 13),
                          text2: "",
                          style2: null,
                          text3: '',
                          style3: null,
                          style4: null,
                          text4: '',
                          text5: '',
                          style5: null,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () => Get.to(() => ProfileView()),
                        child: CommonText(
                            text: 'RESEND NEW CODE',
                            style: CommonTextStyle.gradienttext),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
