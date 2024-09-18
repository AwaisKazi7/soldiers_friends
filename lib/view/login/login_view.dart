import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: Container(
          margin: const EdgeInsets.only(top: 68, right: 8, left: 8),
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  CommonAssets.rankImage,
                ),
                const SizedBox(
                  height: 6,
                ),
                const CommonText(
                  text: "Welcome Back!",
                  style: CommonTextStyle.welcomelogin,
                ),
                CommonText(
                  text: "Sign in to your account",
                  style: CommonTextStyle.welcomelogin
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    CommonTextform(
                      isUnderline: true,
                      textStyle: CommonTextStyle.splashheadline1,
                      hintText: "Email/Number",
                      fillColor: CommonColors.backgroundColor,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonTextform(
                        borderRadius: 8,
                        textStyle: CommonTextStyle.splashheadline1,
                        hintText: "Password",
                        fillColor: CommonColors.backgroundColor,
                        suffixImage: CommonAssets.eyeSplashIcon,
                        controller: TextEditingController()),
                    const SizedBox(
                      height: 34,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        const CommonText(
                          text: "Remember me",
                          style: CommonTextStyle.splashheadline1,
                        ),
                        const Spacer(),
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () => Get.toNamed(RoutesName.usephonepage),
                          child: const CommonText(
                            text: "Forgot Password?",
                            style: CommonTextStyle.splashheadline1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: CommonColors.blackColor,
                          ),
                        ),
                        CommonText(
                          text: "   OR   ",
                          style: CommonTextStyle.getstartedb2Style,
                        ),
                        Expanded(
                          child: Divider(
                            color: CommonColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonButton(
                      height: 50.98,
                      width: 345.59,
                      icon: Image.asset(CommonAssets.appleImage),
                      text: 'Continue with Apple',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      boxShadow: const [],
                      backgroundColor: CommonColors.lightGray,
                      textColor: CommonColors.primaryColor,
                      onPressed: () {},
                      gradient: null,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonButton(
                      height: 50.98,
                      width: 345.59,
                      icon: Image.asset(CommonAssets.googleImage),
                      text: 'Continue with Google',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      boxShadow: const [],
                      backgroundColor: CommonColors.lightGray,
                      textColor: CommonColors.primaryColor,
                      onPressed: () {},
                      gradient: null,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonButton(
                      height: 50.98,
                      width: 345.59,
                      text: 'Sign In',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      boxShadow: const [],
                      backgroundColor: CommonColors.lightGray,
                      textColor: CommonColors.primaryColor,
                      onPressed: () =>
                          Get.offAndToNamed(RoutesName.bottomnavbar),
                      gradient: null,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonButton(
                      height: 50.98,
                      width: 345.59,
                      text: 'Sign Up',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      boxShadow: const [],
                      onPressed: () {
                        Get.toNamed(RoutesName.signuppage);
                      },
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
