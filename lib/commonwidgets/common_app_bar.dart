import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart'; // Ensure this path is correct

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String centerText;
  final ImageProvider? firstImage;
  final ImageProvider? secondImage;
  final Color borderColor;
  final double borderWidth;
  final Color appBarColor;
  final BoxFit firstImageFit; // Fit property for the first image
  final BoxFit secondImageFit; // Fit property for the second image
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
    required TextStyle textStyle,
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
                  child: Image(
                    image: firstImage!,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            ),
          Text(centerText),
          if (secondImage != null)
            Container(
              width: imageSize,
              height: imageSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CommonColors
                    .lightGray, // Background color for the circular container
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
