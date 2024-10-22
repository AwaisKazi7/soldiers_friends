import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_controller.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_widget/dotted_box_widget.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_widget/profile_pic_box.dart';

import '../../common/common_date_picker.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;

  // Variable to store the selected date
  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date; // Store the selected date
    });
    _dateController.text = "${date.day}-${date.month}-${date.year}";
    print(
        "Selected date: ${date.day}/${date.month}/${date.year}"); // For demonstration
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CommonColors.backgroundColor,
          surfaceTintColor: CommonColors.backgroundColor,
          title: CommonText(
            text: "Edit Profile",
            style: CommonTextStyle.splashheadline1
                .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: SizedBox(),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutesName.settingview);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              ),
            )
          ],
        ),
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
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Expanded(child: DottedBoxWidget()),
                    //     SizedBox(width: 10),
                    //     Expanded(child: DottedBoxWidget()),
                    //     SizedBox(width: 10),
                    //     Expanded(child: DottedBoxWidget()),
                    //   ],
                    // ),
                    ProfilePictureRow(),
                    const SizedBox(
                      height: 34,
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
                      child: DatePickerWidget(
                        hintText: "Select Date of birth",
                        controller: controller.DOBController,
                        selectedDate: _selectedDate,
                        onDateSelected:
                            _handleDateSelected, // Pass the callback
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
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
                        hintText: 'Name',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        controller: controller.nameController,
                        fillColor: CommonColors.backgroundColor,
                        borderColor: CommonColors.lightGray,
                        borderRadius: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter fullname';
                          }
                          return null;
                        },
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
                        hintText: 'About',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        controller: controller.BioController,
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
                        hintText: 'Country',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        controller: controller.CountryController,
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
                          text: 'Confirm',
                          isloading: controller.apihitting.value,
                          textStyle: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          borderRadius: 5,
                          boxShadow: const [],
                          onPressed: () async {
                            if (controller.formkey.currentState!.validate()) {
                              controller.DOBController.text =
                                  _dateController.text;
                              var result =
                                  await controller.editProfile(context);
                              if (result) {
                                Get.offAllNamed(RoutesName.bottomnavbar);
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
