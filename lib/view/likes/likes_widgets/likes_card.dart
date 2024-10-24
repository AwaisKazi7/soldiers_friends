import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/imagewidget.dart';
import 'package:soldiers_friends/model/homeData_model.dart';
import 'package:soldiers_friends/model/likes_model.dart';

class LikeCard extends StatelessWidget {
  final homeModel Data;
  final VoidCallback onTap;
  final String verifiedIconPath;

  const LikeCard({
    Key? key,
    required this.Data,
    required this.onTap,
    required this.verifiedIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: ImageWidget(
                  imageUrl: Data.images[0],
                  boxfit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: Data.name,
                  style: CommonTextStyle.splashheadline1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  verifiedIconPath,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
