import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/login/login_view.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 300,
            width: 3400,
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CommonText(
                      text: 'Forget Successfully',
                      style: CommonTextStyle.splashheadline1,
                      textAlign: TextAlign.center,
                    ),
                    const CommonText(
                      text:
                          "Congratulation! your account already created.\nPlease login to get amazing experience.",
                      style: CommonTextStyle.splashheadline1,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CommonButton(
                      text: 'Done',
                      borderRadius: 8,
                      textColor: CommonColors.backgroundColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      boxShadow: const [],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const LoginPage()),
                      child: const CommonText(
                        text: "Go to Homepage",
                        style: CommonTextStyle.splashheadline1,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(height: 350, child: const CustomBottomSheet()));
    },
  );
}
