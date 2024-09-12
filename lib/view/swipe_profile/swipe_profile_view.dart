import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/view/swipe_profile/swipe_profile_controller.dart';

class SwipeProfileView extends StatelessWidget {
  const SwipeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SwipeProfileController>();
    return Scaffold(
      body: GetBuilder<SwipeProfileController>(
        builder: (controller) {
          if (controller.profiles.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: controller.profiles.map((profile) {
              return Positioned(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(profile.imagePath),
                      Text(profile.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
