import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/view/forgotPassword/forgot_controller.dart';
import 'package:soldiers_friends/view/forgotPassword/widgets/otpwidget.dart';

class otpVerificationScreen extends StatelessWidget {
  otpVerificationScreen({
    super.key,
    required this.email,
  });
  final String email;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 300.sp,
                      child: Text(
                        'OTP Verification',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300.sp,
                      child: Text(
                        'Please enter OTP we have sent you on  \nyour email',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  OtpfieldWidget(otpController: controller.OtpController),
                  SizedBox(
                    height: 25.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120.sp,
                          child: Text(
                            "Didn't receive a code? ",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Obx(
                          () => controller.ResendOtploading.value
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: SizedBox(
                                      width: 15.sp,
                                      child: CircularProgressIndicator(
                                        color: CommonColors.gradientEndColor,
                                      )),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await controller.ResendEmail(
                                        context, email);
                                  },
                                  child: SizedBox(
                                    width: 70.sp,
                                    child: Text(
                                      'Resend OTP',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10.sp,
                                          color:
                                              CommonColors.gradientStartColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ]),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              child: Obx(
                () => CommonButton(
                    height: 50.98,
                    width: 345.59,
                    text: 'Confirm',
                    isloading: controller.verifyOtploading.value,
                    textStyle: CommonTextStyle.splashheadline1
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    borderRadius: 5,
                    boxShadow: const [],
                    onPressed: () async {
                      print(controller.emailController.text);
                      await controller.otpVerification(
                          context, controller.OtpController.text, email);
                    }),
              ),
            ),
          );
        });
  }
}
