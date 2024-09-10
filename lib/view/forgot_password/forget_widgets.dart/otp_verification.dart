import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_rich_text.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/forgot_password/forget_widgets.dart/otp_boxes.dart';
import 'package:soldiers_friends/view/forgot_password/forget_widgets.dart/set_password.dart';

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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(18.0),
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
                ],
              ),
              CommonText(
                text: "Verification Code",
                style: CommonTextStyle.splashheadline1
                    .copyWith(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              CommonText(
                text:
                    "We have send the code verification to rafay123@gmail.com",
                style: CommonTextStyle.splashheadline1.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              OtpContainer(onChanged: (v) {}),
              CommonButton(
                  height: 50.98,
                  width: 345.59,
                  borderRadius: 5,
                  boxShadow: [],
                  text: "Submit",
                  textStyle: CommonTextStyle.splashheadline1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  onPressed: () => Get.to(() => const SetPassword())),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(RoutesName.forgotpasswordpage),
                  child: CommonRichText(
                    text1: "Didn't receive the code? ",
                    style1: CommonTextStyle.splashheadline1
                        .copyWith(color: CommonColors.darkGreen),
                    text2: "Resend",
                    style2: CommonTextStyle.splashheadline1,
                    text3: '',
                    style3: null,
                    style4: null,
                    text4: '',
                    text5: '',
                    style5: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
