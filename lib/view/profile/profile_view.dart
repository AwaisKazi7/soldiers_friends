import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/main.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:soldiers_friends/view/profile/profile_controller.dart';
import 'package:soldiers_friends/view/settings/widget/setting_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: CommonColors.backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              height: context.height,
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: CommonColors.buttonGradient,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesName.editprofile);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                    backgroundColor: CommonColors.lightGray,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.toNamed(RoutesName.settingview);
                          //   },
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10.sp),
                          //     child: CircleAvatar(
                          //       backgroundColor: CommonColors.lightGray,
                          //       child: ClipOval(
                          //         child: Image(
                          //           image: AssetImage(
                          //               CommonAssets.threedotsIcon)!,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          SizedBox(
                            height: 10.sp,
                          ),
                          CircleAvatar(
                            radius: 82.sp,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 80.sp,
                                child: ClipOval(
                                  child: ImageWidget(
                                    imageUrl: LocalDataStorage
                                                .userImage.value ==
                                            ''
                                        ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                                        : LocalDataStorage.userImage.value,
                                    height: 200.sp,
                                    width: 200.sp,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            LocalDataStorage.username.value.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                          Text(
                            LocalDataStorage.userEmail.value,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          CommonButton(
                            width: 100.sp,
                            text: 'Friends List',
                            onPressed: () {
                              Get.toNamed(RoutesName.friendlistview);
                            },
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 30.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          buildAccountItemSettings(
                            text: 'Block Users',
                            textStyle: TextStyle(
                              color: Colors.red,
                            ),
                            icon: Icon(
                              Icons.block,
                              color: Colors.red,
                              size: 16,
                            ),
                            onPressed: () {
                              Get.toNamed(RoutesName.blocklistview);
                            },
                          ),
                          const SizedBox(height: 10),
                          buildAccountItemSettings(
                            text: 'Change Password',
                            onPressed: () {
                              Get.toNamed(RoutesName.changepasswordview);
                            },
                          ),
                          const SizedBox(height: 10),
                          buildAccountItemSettings(
                            text: 'Delete Account',
                            textStyle: TextStyle(
                              color: Colors.red,
                            ),
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 16,
                            ),
                            onPressed: () async {
                              Get.toNamed(RoutesName.deleteview);
                            },
                          ),
                          const SizedBox(height: 10),
                          buildAccountItemSettings(
                            text: 'Logout',
                            textStyle: TextStyle(
                              color: Colors.red,
                            ),
                            icon: Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 16,
                            ),
                            onPressed: () async {
                              await controller.Settingcontroller.Logout(
                                  context);
                            },
                          ),
                        ],
                      ),
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
