import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/profile/profile_controller.dart';
import 'package:soldiers_friends/view/profile/profile_widget/dotted_box_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Profile details",
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: DottedBoxWidget()),
                      SizedBox(width: 10),
                      Expanded(child: DottedBoxWidget()),
                      SizedBox(width: 10),
                      Expanded(child: DottedBoxWidget()),
                    ],
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CommonColors.blackColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CommonTextform(
                      hintText: 'Date of birth',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                      controller: TextEditingController(),
                      fillColor: CommonColors.backgroundColor,
                      borderColor: CommonColors.lightGray,
                      suffixImage: CommonAssets.calendarImage,
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
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CommonTextform(
                      hintText: 'Name',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                      controller: TextEditingController(),
                      fillColor: CommonColors.backgroundColor,
                      borderColor: CommonColors.lightGray,
                      borderRadius: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CommonTextform(
                    hintText:
                        'Dedicated soldier serving with honor, \ncourage, and duty. Ready to lead by \nexample.',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                    controller: TextEditingController(),
                    fillColor: CommonColors.backgroundColor,
                    borderColor: CommonColors.lightGray,
                    borderRadius: 5,
                    // minLines: 1,
                    // maxLines: 3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CommonColors.blackColor.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CommonTextform(
                      hintText: 'Country',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                      controller: TextEditingController(),
                      fillColor: CommonColors.backgroundColor,
                      borderColor: CommonColors.lightGray,
                      borderRadius: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Center(
                    child: CommonButton(
                      height: 50.98,
                      width: 345.59,
                      text: 'Confirm',
                      textStyle: CommonTextStyle.splashheadline1
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                      borderRadius: 5,
                      // boxShadow: const [], onPressed: () {},
                      onPressed: () => Get.toNamed(RoutesName.bottomnavbar),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
