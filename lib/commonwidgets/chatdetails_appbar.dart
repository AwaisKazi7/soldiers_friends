import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/imagewidget.dart'; // Ensure this path is correct

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ImageProvider? backIcon;
  final String userImage;
  final String username;
  final String subtitle;
  final ImageProvider? threeDotIcon;

  const ChatDetailAppBar({
    super.key,
    this.backIcon,
    required this.userImage,
    required this.username,
    required this.subtitle,
    this.threeDotIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const double borderWidth = 3.0;

    return AppBar(
      backgroundColor: CommonColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (backIcon != null)
            IconButton(
              icon: CircleAvatar(
                backgroundColor: CommonColors.lightGray,
                child: ClipOval(
                  child: Image(
                    image: backIcon!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          const SizedBox(width: 15),
          if (userImage != null)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CommonColors.gradientStartColor,
                  width: borderWidth,
                ),
              ),
              child: CircleAvatar(
                child: ClipOval(
                    child: ImageWidget(
                  imageUrl: userImage,
                  boxfit: BoxFit.cover,
                  height: 50,
                  width: 50,
                )),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
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
          ),
          const SizedBox(width: 10),
          if (threeDotIcon != null)
            PopupMenuButton<String>(
              icon: CircleAvatar(
                backgroundColor: CommonColors.lightGray,
                child: ClipOval(
                  child: Image(
                    image: threeDotIcon!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onSelected: (value) {
                // Handle menu item selection
                switch (value) {
                  case 'Block':
                    // Handle Option 1
                    break;
                  case 'Report':
                    // Handle Option 2
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Block User',
                    child: Text('Block User'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Report',
                    child: Text('Report'),
                  ),
                ];
              },
            ),
        ],
      ),
      centerTitle: true,
    );
  }
}
