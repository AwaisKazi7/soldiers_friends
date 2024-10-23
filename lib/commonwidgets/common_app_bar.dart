import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/services/localStorage.dart'; // Ensure this path is correct

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String centerText;
  final ImageProvider? firstImage;
  final ImageProvider? secondImage;
  final Color borderColor;
  final double borderWidth;
  final Color appBarColor;
  final BoxFit firstImageFit; // Fit property for the first image
  final BoxFit secondImageFit; // Fit property for the second image
  final TextStyle textStyle; // Add this to use the custom text style
  final ImageProvider? thirdImage;

  const CustomAppBar({
    super.key,
    required this.centerText,
    this.firstImage,
    this.secondImage,
    this.borderColor = Colors.green,
    this.borderWidth = 3.0,
    this.appBarColor = CommonColors.backgroundColor,
    this.firstImageFit = BoxFit.fill,
    this.secondImageFit = BoxFit.fill,
    required this.textStyle,
    this.thirdImage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 45.0;

    return AppBar(
      backgroundColor: appBarColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (firstImage != null)
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
              child: ClipOval(
                child: FittedBox(
                    fit: firstImageFit,
                    child: ImageWidget(
                      imageUrl: LocalDataStorage.userImage.value != ''
                          ? LocalDataStorage.userImage.value
                          : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                      boxfit: BoxFit.cover,
                      width: imageSize,
                      height: imageSize,
                    )),
              ),
            ),
          CommonText(
            text: centerText,
            style: textStyle,
          ),
          if (secondImage != null)
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: FittedBox(
                  fit: secondImageFit,
                  child: Image(
                    image: secondImage!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            ),
        ],
      ),
      centerTitle: true,
    );
  }
}
