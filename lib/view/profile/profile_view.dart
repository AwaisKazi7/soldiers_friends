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

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      String? selectedGender;
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Profile Details",
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage(CommonAssets.soldierswipesecondImage),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CommonColors.darkGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: 'First Name',
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
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
                      hintText: 'Enter First Name',
                      hintStyle: CommonTextStyle.getstartedt1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w200),
                      controller: TextEditingController(),
                      fillColor: CommonColors.backgroundColor,
                      borderColor: CommonColors.lightGray,
                      borderRadius: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonText(
                    text: 'Last Name',
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
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
                      hintText: 'Enter Last Name',
                      hintStyle: CommonTextStyle.getstartedt1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w200),
                      controller: TextEditingController(),
                      fillColor: CommonColors.backgroundColor,
                      borderColor: CommonColors.lightGray,
                      borderRadius: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonText(
                    text: 'Select Gender',
                    style: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
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
                    child: DropdownButtonFormField<String>(
                      dropdownColor: CommonColors.backgroundColor,
                      value: selectedGender,
                      hint: CommonText(
                        text: 'Select Gender',
                        style: CommonTextStyle.getstartedt1.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CommonColors.backgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: CommonColors.lightGray),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: CommonColors.lightGray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: CommonColors.backgroundColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other'),
                        ),
                        DropdownMenuItem(
                          value: 'Not Confirmed',
                          child: Text('Not Confirmed'),
                        ),
                      ],
                      onChanged: (value) {
                        selectedGender = value;
                      },
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
                      boxShadow: const [],
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
