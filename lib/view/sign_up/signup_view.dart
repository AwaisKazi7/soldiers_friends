import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/common/custom_textfield.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';
import 'package:soldiers_friends/view/login/login_view.dart';
import 'package:soldiers_friends/view/sign_up/signup_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: CircleAvatar(
                    backgroundColor: CommonColors.lightGray,
                    child: ClipOval(
                      child: Image.asset(
                        CommonAssets.backarrowIcon,
                        fit: BoxFit.cover,
                        width: 70, // Responsive sizing
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(
                  CommonAssets.rankImage,
                ),
                const CommonText(
                  text: "Welcome",
                  style: CommonTextStyle.welcomelogin,
                ),
                CommonText(
                  text: "Create your account",
                  style: CommonTextStyle.welcomelogin
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: controller.formkey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CommonColors.blackColor.withOpacity(0.1),
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: CustomTextFieldWidget(
                          enabled: true,
                          label: '',
                          controller: controller.fullnameController,
                          hintText: "Fullname",
                          inputType: TextInputType.name,
                          focusNode: controller.NameFocusNode,
                          onchange: (value) {
                            controller.apihitting.value = false;
                          },
                          onsubmit: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter fullname';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CommonColors.blackColor.withOpacity(0.1),
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: CustomTextFieldWidget(
                          enabled: true,
                          label: '',
                          controller: controller.EmailController,
                          hintText: "Email",
                          inputType: TextInputType.name,
                          focusNode: controller.EmailFocusNode,
                          onchange: (value) {
                            controller.apihitting.value = false;
                          },
                          onsubmit: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address';
                            }
                            const emailPattern =
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$';
                            if (!RegExp(emailPattern).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CommonColors.blackColor.withOpacity(0.1),
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: CustomTextFieldWidget(
                          enabled: true,
                          label: '',
                          controller: controller.PassowrdController,
                          hintText: "Password",
                          inputType: TextInputType.name,
                          focusNode: controller.PasswordFocusNode,
                          onchange: (value) {
                            controller.apihitting.value = false;
                          },
                          onsubmit: () {},
                          validator: (input) => input!.length < 3
                              ? 'Please enter at least 3 characters'
                              : input.length > 20
                                  ? 'Please enter less then 20 characters'
                                  : null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CommonColors.blackColor.withOpacity(0.1),
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: CustomTextFieldWidget(
                          enabled: true,
                          label: '',
                          controller: controller.confirmPasswordController,
                          hintText: "Confirm Password",
                          inputType: TextInputType.name,
                          focusNode: controller.ConfirmPasswordFocusNode,
                          onchange: (value) {
                            controller.apihitting.value = false;
                          },
                          onsubmit: () {},
                          validator: (input) => input!.length < 3
                              ? 'Please enter at least 3 characters'
                              : input.length > 20
                                  ? 'Please enter less then 20 characters'
                                  : null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CommonColors.blackColor.withOpacity(0.1),
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: CustomTextFieldWidget(
                          enabled: true,
                          label: 'Phone number',
                          controller: controller.phoneController,
                          hintText: "Phone number",
                          inputType: TextInputType.number,
                          focusNode: controller.PhoneFocusNode,
                          onchange: (value) {
                            controller.apihitting.value = false;
                          },
                          onsubmit: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter ';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CommonText(
                            text: 'Already have an account?',
                            style: CommonTextStyle.splashheadline1,
                          ),
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () => Get.to(() => LoginPage()),
                            child: Align(
                              child: CommonText(
                                text: 'Sign In',
                                style: CommonTextStyle.splashheadline1.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: CommonColors.blackColor,
                                  decorationThickness: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonButton(
                        height: 50.98,
                        width: 345.59,
                        text: 'Sign Up',
                        textStyle: CommonTextStyle.splashheadline1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        borderRadius: 5,
                        boxShadow: const [],
                        onPressed: () async {
                          if (controller.formkey.currentState!.validate()) {
                            if (controller.PassowrdController.text ==
                                controller.confirmPasswordController.text) {
                              var result =
                                  await controller.signUpWithEmailAndPhone(
                                      controller.EmailController.text,
                                      controller.PassowrdController.text,
                                      context);
                              if (result)
                                Get.toNamed(RoutesName.bottomnavbar);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Password doesn't Match"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
