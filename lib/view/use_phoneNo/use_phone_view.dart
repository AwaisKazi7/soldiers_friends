import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_rich_text.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/view/forgot_password/forgot_widgets.dart/otp_verification.dart';
import 'package:soldiers_friends/view/use_phoneNo/use_phone_controller.dart';
import 'package:soldiers_friends/view/use_phoneNo/use_phone_widget/country_dropdown.dart';

class UsePhoneView extends StatelessWidget {
  final ValueNotifier<String?> countryCodeNotifier =
      ValueNotifier<String?>(null);
  final TextEditingController phoneNumberController = TextEditingController();
  UsePhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryCodeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SafeArea(
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
                    width: context.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(CommonAssets.handphoneImage),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonText(
                            text: 'Enter Mobile Number',
                            style: CommonTextStyle.splashheadline1.copyWith(
                                fontSize: 32, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 2,
                        ),
                        CommonText(
                            text:
                                "Add your phone number. We'll send you a verification",
                            style: CommonTextStyle.splashheadline1.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w400)),
                        CommonText(
                            text: "code so we know you're real.",
                            style: CommonTextStyle.splashheadline1.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: CustomDropdown(
                                height: 50.98,
                                width: 86.5,
                                dropdownIconPath: CommonAssets.dropdownIcon,
                                hintText: 'Select\nCode',
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: CommonColors.blackColor
                                        .withOpacity(0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 0),
                                  ),
                                ], borderRadius: BorderRadius.circular(5)),
                                child: CommonTextform(
                                  hintText: '',
                                  controller: phoneNumberController,
                                  fillColor: CommonColors.backgroundColor,
                                  borderColor: CommonColors.backgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CommonButton(
                          height: 50.98,
                          width: 345.59,
                          text: 'Confirm',
                          textStyle: CommonTextStyle.splashheadline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          borderRadius: 5,
                          boxShadow: const [],
                          onPressed: () => Get.to(() => OtpVerification()),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CommonRichText(
                          text1:
                              'By providing my phone number, I hereby agree and\n accept the',
                          style1: CommonTextStyle.getstartedt1,
                          text2: ' Terms of Service',
                          style2: CommonTextStyle.gradienttext.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          text3: ' and',
                          style3: CommonTextStyle.getstartedt1,
                          text4: ' Privacy Policy.',
                          style4: CommonTextStyle.gradienttext.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                          text5: '',
                          style5: CommonTextStyle.getstartedt1,
                          maxLines: 3,
                          overflow: TextOverflow.visible,
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
