import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/services/getx_helper.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  ImagePickerBottomSheet({
    Key? key,
  }) : super(key: key);
  @override

  /// it required two perm context and foraddons
  /// foraddons = true if will work for addons
  /// foraddons = false for normal uploading
  static Future show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      builder: (context) {
        return ImagePickerBottomSheet();
      },
    );
  }

  final controllersProvider = Get.put(GetxControllersProvider());
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
          // gradient: themecontroller.containerGradient,
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
                Text(
                  "select image",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controllersProvider.getFromCameraImage();
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      backgroundColor: CommonColors.gradientEndColor,
                    ),
                  ),
                  SizedBox(
                    width: 30.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      controllersProvider.getImage();
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      backgroundColor: CommonColors.gradientEndColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
