import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/login/login_controller.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtion_controller.dart';

class SubscribtionView extends StatelessWidget {
  const SubscribtionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribtionController>(builder: (controller) {
      // Screen size dimensions
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.08, right: 8, left: 8),
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            backgroundColor: CommonColors.lightGray,
                            child: ClipOval(
                              child: Image.asset(
                                CommonAssets.backarrowIcon,
                                fit: BoxFit.cover,
                                width: screenWidth * 0.07, // Responsive sizing
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CommonText(
                          text: "Are you a real soldier",
                          style: CommonTextStyle.splashheadline1.copyWith(
                              fontSize:
                                  screenWidth * 0.045, // Responsive font size
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: screenWidth * 0.16),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    Center(
                      child: CommonText(
                        textAlign: TextAlign.center,
                        text:
                            'Verify your identity by uploading your \n passport or a valid ID.',
                        style: CommonTextStyle.splashheadline1.copyWith(
                            fontSize:
                                screenWidth * 0.04, // Responsive font size
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  ],
                ),
                Center(
                  child: Image.asset(
                    fit: BoxFit.contain,
                    height: 300,
                    width: 200,
                    CommonAssets.rankImage,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildFeatureItem({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
