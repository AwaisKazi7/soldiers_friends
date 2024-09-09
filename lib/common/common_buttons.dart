import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'common_text_style.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final List<BoxShadow> boxShadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle textStyle;
  final Color borderColor;
  final double borderWidth;
  final bool isBorderColor;
  final Widget? icon;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradient = CommonColors.buttonGradient,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.margin,
    this.width,
    this.height = 40,
    this.borderRadius = 10,
    this.borderWidth = 1,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    this.textStyle = CommonTextStyle.commonButtonStyle,
    this.isBorderColor = false,
    this.borderColor = Colors.transparent,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? backgroundColor : null,
          border: Border.all(
            color: !isBorderColor ? Colors.transparent : borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
