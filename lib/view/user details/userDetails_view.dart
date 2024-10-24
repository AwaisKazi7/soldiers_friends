import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/main.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/view/user%20details/userDetails_controller.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class UserDetailView extends StatelessWidget {
  UserDetailView({
    super.key,
    required this.data,
  });
  final homeModel data;

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
                            child: ListWheelScrollViewX(
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
                                                  BorderRadius.circular(20.sp),
                                              child: ImageWidget(imageUrl: e),
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
                      Obx(
                        () => Visibility(
                          visible: controller.showmessageBox.value == false,
                          replacement: CommonButton(
                            text: 'start Chatting',
                            gradient: CommonColors.buttonGradient,
                            onPressed: () {},
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor:
                                      CommonColors.gradientStartColor,
                                  radius: 30.sp,
                                  child: Icon(
                                    Icons.cancel_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 20.sp,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await controller.AddFriendApi(
                                      context, data.id);
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      CommonColors.gradientEndColor,
                                  radius: 30.sp,
                                  child: controller.AddFriendloading.value
                                      ? SizedBox(
                                          height: 20.sp,
                                          width: 20.sp,
                                          child: CircularProgressIndicator(color: Colors.white,),
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
