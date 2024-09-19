import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/login/login_view.dart';
import 'package:soldiers_friends/view/sign_up/signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  CommonAssets.rankImage,
                ),
                const CommonText(
                  text: "Welcome Back!",
                  style: CommonTextStyle.welcomelogin,
                ),
                CommonText(
                  text: "Create your account",
                  style: CommonTextStyle.welcomelogin
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                Column(
                  children: [
                    CommonTextform(
                      hintText: 'Fullname',
                      textStyle: CommonTextStyle.splashheadline1,
                      fillColor: CommonColors.backgroundColor,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextform(
                      hintText: 'Email',
                      textStyle: CommonTextStyle.splashheadline1,
                      fillColor: CommonColors.backgroundColor,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextform(
                      hintText: 'Password',
                      textStyle: CommonTextStyle.splashheadline1,
                      fillColor: CommonColors.backgroundColor,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextform(
                      hintText: 'Confirm Password',
                      textStyle: CommonTextStyle.splashheadline1,
                      fillColor: CommonColors.backgroundColor,
                      controller: TextEditingController(),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CommonText(
                            text: 'Already have an account?',
                            style: CommonTextStyle.splashheadline1,
                          ),
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () => Get.to(() => const LoginPage()),
                            child: Align(
                              child: CommonText(
                                text: 'Sign In',
                                style: CommonTextStyle.splashheadline1.copyWith(
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: CommonColors.blackColor,
                                  decorationThickness: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonButton(
                          height: 50.98,
                          width: 345.59,
                          text: 'Sign Up',
                          textStyle: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          borderRadius: 5,
                          boxShadow: const [],
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
