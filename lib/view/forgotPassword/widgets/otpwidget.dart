import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_colors.dart';

class OtpfieldWidget extends StatelessWidget {
  const OtpfieldWidget({
    super.key,
    required this.otpController,
    this.validation,
  });

  final TextEditingController otpController;
  final Function(String?)? validation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      child: PinCodeTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        animationType: AnimationType.fade,
        appContext: context,
        textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "Manrope",
            fontSize: 24),
        pastedTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "Manrope",
            fontSize: 24),
        length: 4,
        // validator: Validators.otpValidator,
        errorTextSpace: 23,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(9),
          fieldHeight: 69,
          fieldWidth: 69,
          activeFillColor: CommonColors.gradientStartColor.withOpacity(0.1),
          activeColor: CommonColors.gradientStartColor.withOpacity(0.3),
          selectedFillColor: CommonColors.gradientStartColor.withOpacity(0.2),
          selectedColor: CommonColors.gradientStartColor.withOpacity(0.1),
          inactiveFillColor: CommonColors.gradientStartColor.withOpacity(0.2),
          inactiveColor: Colors.transparent,
        ),
        errorTextMargin: const EdgeInsets.only(top: 10),
        hintStyle: const TextStyle(color: Colors.white),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: otpController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          debugPrint("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          // debugPrint(value);
          // setState(() {
          //   currentText = value;
          // });
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          return true;
        },
      ),
    );
  }
}
