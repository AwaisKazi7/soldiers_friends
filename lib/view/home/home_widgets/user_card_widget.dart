import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/home_model.dart';

class UserCard extends StatelessWidget {
  final homeModel user;

  const UserCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageWidget(
              imageUrl: user.images.isNotEmpty
                  ? user.images[0]
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              height: double.infinity,
              width: double.infinity,
              boxfit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CommonText(
                    text: user.name,
                    style: CommonTextStyle.getstartedb1Style.copyWith(
                        color: CommonColors.backgroundColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 8),
                  // Image.asset(
                  //   user.verifiedIconPath,
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Image.asset(
                  //   user.locationIconPath,
                  // ),
                  const SizedBox(width: 4),
                  CommonText(
                    text: user.country,
                    style: CommonTextStyle.getstartedb1Style.copyWith(
                        color: CommonColors.backgroundColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
