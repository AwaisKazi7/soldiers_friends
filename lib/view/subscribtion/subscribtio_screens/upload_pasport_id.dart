import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
// import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';
// import 'package:soldiers_friends/routes/routes_name_strings.dart';
// import 'package:soldiers_friends/view/login/login_controller.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtio_screens/purchase_screen.dart';
import 'package:soldiers_friends/view/subscribtion/subscribtion_controller.dart';

class UploadPasportId extends StatelessWidget {
  const UploadPasportId({super.key});

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
                          textAlign: TextAlign.center,
                          text: "Upload your passport \n or a valid ID",
                          style: CommonTextStyle.splashheadline1.copyWith(
                              fontSize:
                                  screenWidth * 0.045, // Responsive font size
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: screenWidth * 0.16),
                      ],
                    ),
                    Center(
                      child: Image.asset(
                        CommonAssets.passport,
                        height: screenHeight * 0.3,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  ],
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
                    hintText: 'Upload + Photo',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                    controller: TextEditingController(),
                    fillColor: CommonColors.backgroundColor,
                    borderColor: CommonColors.lightGray,
                    suffixImage: CommonAssets.upload,
                    borderRadius: 5,
                  ),
                ),
                SizedBox(height: 16),
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
                    hintText: 'Take + Photo',
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                    controller: TextEditingController(),
                    fillColor: CommonColors.backgroundColor,
                    borderColor: CommonColors.lightGray,
                    suffixImage: CommonAssets.camera,
                    borderRadius: 5,
                  ),
                ),
                SizedBox(height: 30),
                CommonButton(
                  borderRadius: 3,
                  text: "Continue",
                  textStyle: CommonTextStyle.getstartedb1Style
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  onPressed: () => Get.to(() => MyHomePage()),
                  height: 46,
                  boxShadow: [],
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
            color: Colors.grey.withOpacity(0.6),
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
