import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/model/country_code.dart';
import 'package:soldiers_friends/view/forgotPassword/forgot_controller.dart';

class CustomDropdown extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowBlurRadius;
  final String dropdownIconPath;
  final String hintText;

  CustomDropdown({
    required this.height,
    required this.width,
    this.backgroundColor = Colors.white,
    this.shadowColor = CommonColors.blackColor,
    this.shadowBlurRadius = 6,
    required this.dropdownIconPath,
    required this.hintText, // Default dropdown icon
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(), // Initialize the controller
      builder: (controller) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.2),
                blurRadius: shadowBlurRadius,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<CountryCode>(
            value: controller.selectedCountryCode,
            hint: Center(
              child: Text(
                // Display the hint text
                hintText,
                style: CommonTextStyle.splashheadline1
                    .copyWith(fontSize: 12), // Customize hint text style
              ),
            ),
            items: controller.countryCodes.map((CountryCode countryCode) {
              return DropdownMenuItem<CountryCode>(
                value: countryCode,
                child: Align(
                    alignment: Alignment.center, child: Text(countryCode.code)),
              );
            }).toList(),
            onChanged: (CountryCode? newValue) {
              controller.selectCountryCode(newValue);
            },
            isExpanded: true,
            underline: const SizedBox(), // Hide the default underline
            dropdownColor:
                backgroundColor, // Set dropdown menu background color
            icon: Padding(
              padding: const EdgeInsets.only(
                  right: 12.0), // Add some padding to the right of the icon
              child: Image.asset(
                dropdownIconPath,
                color: CommonColors.neutralGray, // Customize the icon color
              ),
            ),
            iconSize: 24.0, // Customize the size of the dropdown icon
            style: const TextStyle(color: Colors.black), // Customize text style
          ),
        );
      },
    );
  }
}
