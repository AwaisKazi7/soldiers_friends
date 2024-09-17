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
          margin: const EdgeInsets.all(18.0),
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        const SizedBox(
                          height: 2,
                        ),
                        CommonText(
                          text: "Sign in to your account",
                          style: CommonTextStyle.welcomelogin.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
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
                                textStyle: CommonTextStyle.splashheadline1,
                                hintText: "Email/Number",
                                fillColor: CommonColors.backgroundColor,
                                borderColor: Colors.transparent,
                                controller: TextEditingController(),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                  textStyle: CommonTextStyle.splashheadline1,
                                  hintText: "Password",
                                  fillColor: CommonColors.backgroundColor,
                                  borderColor: Colors.transparent,
                                  suffixImage: CommonAssets.eyeSplashIcon,
                                  controller: TextEditingController()),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
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
                                ]),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  onTap: () =>
                                      Get.toNamed(RoutesName.usephonepage),
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: CommonText(
                                      text: "Forgot Password?",
                                      style: CommonTextStyle.splashheadline1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
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
                              height: 14,
                            ),
                            CommonButton(
                              height: 50.98,
                              width: 345.59,
                              icon: Image.asset(CommonAssets.appleImage),
                              text: 'Continue with Apple',
                              textStyle: CommonTextStyle.splashheadline1
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                              text: 'Sign Up',
                              textStyle: CommonTextStyle.splashheadline1
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
