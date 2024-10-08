import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_widget/dotted_border_painter.dart';

class DottedBoxWidget extends StatelessWidget {
  const DottedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: CommonColors.blackColor,
        strokeWidth: 1,
        dashWidth: 16,
        dashSpace: 3,
      ),
      child: Container(
        width: 113.32, // Adjust width as needed
        height: 178.15, // Adjust height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          color: Colors.transparent,
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: CommonColors.blackColor,
            size: 34,
          ),
        ),
      ),
    );
  }
}
