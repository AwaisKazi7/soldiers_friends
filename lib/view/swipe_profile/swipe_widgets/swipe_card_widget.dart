import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/model/swipe_model.dart';

class SwipeCardWidget extends StatelessWidget {
  final SwipeItemModel swipeItem;

  const SwipeCardWidget({
    super.key,
    required this.swipeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 160.0, left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              swipeItem.imagePath,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 490,
              left: 20,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: swipeItem.name,
                    style: CommonTextStyle.getstartedb1Style.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  CommonText(
                    text: swipeItem.location,
                    style: CommonTextStyle.getstartedb1Style.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
