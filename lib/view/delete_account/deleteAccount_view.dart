import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_controller.dart';
import 'package:soldiers_friends/view/settings/widget/setting_widget.dart';
import '../../common/common_colors.dart';
import '../../common/common_text.dart';
import '../../common/common_text_style.dart';
import '../../routes/routes_name_strings.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteaccountController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(12),
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                text: 'Delete Account',
                style: CommonTextStyle.loginAccountStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
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
                  hintText: "Enter Password",
                  fillColor: CommonColors.backgroundColor,
                  controller: controller.passowrdController,
                  isUnderline: false,
                  borderColor: CommonColors.backgroundColor,
                  borderRadius: 5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CommonButton(
                  height: 50,
                  // width: 100,
                  text: 'Delete Account',
                  gradient: null,
                  backgroundColor: Colors.red,
                  textStyle: CommonTextStyle.splashheadline1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  borderRadius: 5,
                  boxShadow: const [],
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: CommonColors.backgroundColor,
                          child: Container(
                            height: 200,
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Delete Account',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Are you sure you want to delete your account?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Obx(
                                      () => CommonButton(
                                          height: 30,
                                          width: 100,
                                          text: 'Yes',
                                          isloading: controller.loading.value,
                                          textStyle: CommonTextStyle
                                              .splashheadline1
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                          borderRadius: 5,
                                          boxShadow: const [],
                                          onPressed: () async {
                                            await controller.deleteAccount(
                                                context,
                                                controller
                                                    .passowrdController.text);
                                          }),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CommonButton(
                                        height: 30,
                                        width: 100,
                                        text: 'No',
                                        textStyle: CommonTextStyle
                                            .splashheadline1
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                        borderRadius: 5,
                                        boxShadow: const [],
                                        onPressed: () {
                                          Get.back();
                                        }),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        )),
      );
    });
  }
}
