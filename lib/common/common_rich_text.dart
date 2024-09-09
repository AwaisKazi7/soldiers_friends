import 'package:flutter/material.dart';

class CommonRichText extends StatelessWidget {
  final String text1;
  final TextStyle style1;
  final String text2;
  final TextStyle style2;
  final String text3;
  final TextStyle style3;
  final String text4;
  final TextStyle style4;
  final String text5;
  final TextStyle style5;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CommonRichText({
    super.key,
    required this.text1,
    required this.style1,
    required this.text2,
    required this.style2,
    required this.text3,
    required this.style3,
    required this.text4,
    required this.style4,
    required this.text5,
    required this.style5,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: style1,
          ),
          TextSpan(
            text: text2,
            style: style2,
          ),
          TextSpan(
            text: text3,
            style: style3,
          ),
          TextSpan(
            text: text4,
            style: style4,
          ),
          TextSpan(
            text: text5,
            style: style5,
          ),
        ],
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
