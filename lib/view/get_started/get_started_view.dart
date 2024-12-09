import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soldiers_friends/Common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_rich_text.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/notificationService/localNotification.dart';
import 'package:soldiers_friends/services/localStorage.dart';
import 'package:soldiers_friends/view/get_started/get_started_controller.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
    _initializeNotifications();
  }
  Future<void> requestNotificationPermission() async {
  var status = await Permission.notification.status;

  if (!status.isGranted) {
    // Request permission
    final result = await Permission.notification.request();

    if (result.isGranted) {
      print("Notification permission granted!");
    } else {
      print("Notification permission denied!");
    }
  } else {
    print("Notification permission already granted!");
  }
}

  Future<void> _initializeNotifications() async {
    await LocalDataStorage.getInstance.getUserData();
    LocalNotificationService.getInstance.initialize(context);

    // Handle cold start (app launched via notification)
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null && message.data.isNotEmpty) {
        final route = message.data;
        // Fluttertoast.showToast(msg: 'navigate terminated:${message.data}');
        await LocalNotificationService.getInstance.handleNotification(route);
      }
    });

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });

    // Handle background notifications
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final route = message.data['key']; // Adjust key as per your route logic
      if (route != null) {
        LocalNotificationService.getInstance.handleNotification(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedController>(builder: (controller) {
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      CommonAssets.logo,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0),
                              Colors.white,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Center(
                        child: Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  CommonColors.gradientEndColor,
                                  CommonColors.gradientStartColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              blendMode: BlendMode.srcIn,
                              child: const CommonText(
                                textAlign: TextAlign.center,
                                text: 'Soldiers Friends',
                                style: CommonTextStyle.splashtitle,
                              ),
                            ),
                            const CommonText(
                              text: 'For Deployed or Veteran Soldiers',
                              style: CommonTextStyle.splashheadline1,
                            ),
                            CommonText(
                              text: ' in need of a friend or support.',
                              style: CommonTextStyle.splashheadline1.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CommonButton(
                  text: 'Get Started',
                  height: 50.98,
                  width: 345.59,
                  borderRadius: 5,
                  textStyle: CommonTextStyle.getstartedb1Style,
                  boxShadow: const [],
                  onPressed: () async {
                    await controller.onGetStartedPressed();
                  },
                ),
                const SizedBox(height: 10),
                const CommonRichText(
                  text1: 'By signing up you agree to our',
                  style1: CommonTextStyle.getstartedt1,
                  text2: ' Terms',
                  style2: CommonTextStyle.getstartedt2,
                  text3: ' and\n',
                  style3: CommonTextStyle.getstartedt1,
                  text4: ' Privacy policy',
                  style4: CommonTextStyle.getstartedt2,
                  textAlign: TextAlign.center,
                  text5: ' we protect your personal data',
                  style5: CommonTextStyle.getstartedt1,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
