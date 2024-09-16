import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart'; // Ensure this path is correct

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ImageProvider? backIcon;
  final ImageProvider? userImage;
  final String username;
  final String subtitle;
  final ImageProvider? threeDotIcon;

  const ChatDetailAppBar({
    super.key,
    this.backIcon,
    this.userImage,
    required this.username,
    required this.subtitle,
    this.threeDotIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 45.0; // Diameter of CircleAvatars

    return AppBar(
      backgroundColor: CommonColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (backIcon != null)
            IconButton(
              icon: CircleAvatar(
                backgroundColor: CommonColors.lightGray,
                radius: imageSize / 2,
                child: ClipOval(
                  child: Image(
                    image: backIcon!,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit
                        .contain, // Adjust fit to ensure image is properly contained
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          if (userImage != null)
            CircleAvatar(
              backgroundImage: userImage,
              radius: imageSize / 2,
            ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                text: username,
                style: CommonTextStyle.splashheadline1
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CommonText(
                text: subtitle,
                style: CommonTextStyle.splashheadline1
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          if (threeDotIcon != null)
            CircleAvatar(
              backgroundColor: CommonColors.lightGray,
              radius: imageSize / 2,
              child: ClipOval(
                child: Image(
                  image: threeDotIcon!,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit
                      .contain, // Use cover to ensure the image covers the entire area
                ),
              ),
            ),
        ],
      ),
      centerTitle: true,
    );
  }
}
