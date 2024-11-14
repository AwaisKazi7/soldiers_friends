import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/user%20details/userDetails_controller.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class UserDetailView extends StatelessWidget {
  UserDetailView({
    super.key,
    required this.data,
    required this.isMylike,
  });
  final homeModel data;
  final int isMylike;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailsController>(builder: (controller) {
      return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 600.sp,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: data.images.isEmpty
                                ? Hero(
                                    tag: 'product-image${data.id}',
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 600.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.sp)),
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            child: ImageWidget(
                                                imageUrl:
                                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10.sp,
                                          right: 30.sp,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.image_outlined,
                                                    size: 15.sp,
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                  ),
                                                  Text(
                                                    data.images.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.4)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : ListWheelScrollViewX(
                                    itemExtent: 400.sp,
                                    scrollDirection: Axis.horizontal,
                                    children: data.images
                                        .map(
                                          (e) => Hero(
                                            tag: 'product-image${data.id}',
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 600.sp,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.sp)),
                                                  width: double.infinity,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.sp),
                                                    child: ImageWidget(
                                                        imageUrl: e),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 10.sp,
                                                  right: 30.sp,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.sp)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .image_outlined,
                                                            size: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.4),
                                                          ),
                                                          Text(
                                                            data.images.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 8.sp,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.4)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 30.sp,
                        left: 20.sp,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_back),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        width: 300.sp,
                        child: Text(
                          textAlign: TextAlign.center,
                          data.name,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SizedBox(
                        width: 300.sp,
                        child: Text(
                          data.country,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Visibility(
                        visible: isMylike == 1,
                        replacement: Column(
                          children: [
                            Center(
                              child: Container(
                                padding: EdgeInsets.all(20.sp),
                                decoration: BoxDecoration(
                                    gradient: CommonColors.buttonGradient,
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Text(
                                  'Your request is in pending',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                        child: Obx(
                          () => Visibility(
                            visible: controller.showmessageBox.value == false,
                            replacement: CommonButton(
                              text: 'See Friend List',
                              gradient: CommonColors.buttonGradient,
                              onPressed: () {
                                Get.toNamed(RoutesName.friendlistview);
                              },
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await controller.dislikeApi(context, data);
                                  },
                                  child: CircleAvatar(
                                      backgroundColor:
                                          CommonColors.gradientStartColor,
                                      radius: 30.sp,
                                      child: controller.Dislikeloading.value
                                          ? SizedBox(
                                              height: 20.sp,
                                              width: 20.sp,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Icon(
                                              Icons.cancel_sharp,
                                              size: 30,
                                              color: Colors.white,
                                            )),
                                ),
                                SizedBox(
                                  width: 20.sp,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await controller.AddFriendApi(
                                        context, data);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        CommonColors.gradientEndColor,
                                    radius: 30.sp,
                                    child: controller.AddFriendloading.value
                                        ? SizedBox(
                                            height: 20.sp,
                                            width: 20.sp,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            // CommonAssets.handphoneImage,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
