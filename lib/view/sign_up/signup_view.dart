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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  CommonAssets.rankImage,
                ),
                const SizedBox(
                  height: 36,
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                        hintText: 'Fullname',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                        hintText: 'Email',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                        hintText: 'Password',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.blackColor,
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: CommonTextform(
                        hintText: 'Confirm Password',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: Colors.transparent,
                        controller: TextEditingController(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Row(
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CommonButton(
                      height: 50.98,
                      width: 345.59,
                      text: 'Sign Up',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      boxShadow: const [],
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
