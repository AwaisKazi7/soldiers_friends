import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/delete_account/deleteAccount_controller.dart';
import 'package:soldiers_friends/view/sign_up/signup_controller.dart';
import '../../common/common_colors.dart';
import '../../common/common_text.dart';
import '../../common/common_text_style.dart';

class uploadProfilePictureView extends StatelessWidget {
  const uploadProfilePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonText(
                    text: "skip",
                    style: CommonTextStyle.loginAccountStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 2),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: CommonColors.blackColor,
                    ),
                    onPressed: () => Get.toNamed(RoutesName.subscribtion),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: CommonText(
                  text: 'Upload Profile Picture',
                  style: CommonTextStyle.loginAccountStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 50.sp),
                child: GestureDetector(
                  onTap: () async {
                    controller.profilePicture.value =
                        await controller.pickImage();
                  },
                  child: Obx(
                    () => controller.profilePicture.value == ''
                        ? Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: CommonColors.blackColor
                                        .withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 30.sp,
                                  color: CommonColors.gradientStartColor,
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Text('Upload your profile picture',
                                    style: TextStyle(
                                      color: CommonColors.gradientStartColor,
                                    ))
                              ],
                            ),
                          )
                        : Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: CommonColors.blackColor
                                        .withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(
                                        controller.profilePicture.value)))),
                          ),
                  ),
                ),
              )),
              Obx(
                () => CommonButton(
                    height: 50,
                    // width: 100,
                    text: 'Upload',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    borderRadius: 5,
                    isloading: controller.uploading.value,
                    boxShadow: const [],
                    onPressed: () async {
                      if (controller.profilePicture.value != '') {
                        var flag = await controller.uploadProfilePicture();
                        if (flag) {
                          Get.toNamed(RoutesName.subscribtion);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please Select image first'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        )),
      );
    });
  }
}
