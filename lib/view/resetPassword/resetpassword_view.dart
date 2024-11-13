import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/resetPassword/resetpassword_Controller.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Form(
                key: controller.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                            color: CommonColors.blackColor,
                          ),
                          onPressed: () => Get.back(),
                        ),
                        const SizedBox(width: 2),
                        CommonText(
                          text: "Back",
                          style: CommonTextStyle.loginAccountStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CommonText(
                      text: 'Set New Password',
                      style: CommonTextStyle.loginAccountStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                        hintText: 'Enter new Password',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        controller: controller.NewPasswordController,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: CommonColors.lightGray,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
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
                        hintText: 'Enter confirm Password',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        controller: controller.ConfirmPasswordController,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: CommonColors.lightGray,
                        borderRadius: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Obx(
                        () => CommonButton(
                          height: 50.98,
                          width: 345.59,
                          text: 'Set New Password',
                          isloading: controller.apihitting.value,
                          textStyle: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          borderRadius: 5,
                          boxShadow: const [],
                          onPressed: () async {
                            if (controller.formkey.currentState!.validate()) {
                              if (controller.NewPasswordController.text ==
                                  controller.ConfirmPasswordController.text) {
                                await controller.ResetPassword(context, email);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Passwords Doesn't Match"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
