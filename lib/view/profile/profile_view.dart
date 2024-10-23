import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/view/profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      
      return Scaffold(
        backgroundColor: CommonColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(18.0),
            height: context.height,
            width: context.width,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
