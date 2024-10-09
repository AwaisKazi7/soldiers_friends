import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
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
                IconButton(
                  icon: CircleAvatar(
                    backgroundColor: CommonColors.lightGray,
                    child: ClipOval(
                      child: Image.asset(
                        CommonAssets.backarrowIcon,
                        fit: BoxFit.cover,
                        width: 70, // Responsive sizing
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(
                  CommonAssets.rankImage,
                ),
                const CommonText(
                  text: "Welcome",
                  style: CommonTextStyle.welcomelogin,
                ),
                CommonText(
                  text: "Create your account",
                  style: CommonTextStyle.welcomelogin
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
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
                        hintText: 'Fullname',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        controller: TextEditingController(),
                        isUnderline: false,
                        borderColor: CommonColors.backgroundColor,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        hintText: 'Email',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        controller: TextEditingController(),
                        isUnderline: false,
                        borderColor: CommonColors.backgroundColor,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        hintText: 'Password',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        controller: TextEditingController(),
                        isUnderline: false,
                        borderColor: CommonColors.backgroundColor,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        hintText: 'Confirm Password',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        controller: TextEditingController(),
                        isUnderline: false,
                        borderColor: CommonColors.backgroundColor,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                        hintText: 'Mobile Number',
                        textStyle: CommonTextStyle.splashheadline1,
                        fillColor: CommonColors.backgroundColor,
                        controller: TextEditingController(),
                        isUnderline: false,
                        borderColor: CommonColors.backgroundColor,
                        borderRadius: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                                  fontSize: 16,
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
                            fontSize: 16, fontWeight: FontWeight.w500),
                        borderRadius: 5,
                        boxShadow: const [],
                        onPressed: () {
                          Get.toNamed(RoutesName.loginPage);
                        },
                      ),
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
