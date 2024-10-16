import 'package:flutter/material.dart';
import 'package:soldiers_friends/view/settings/widget/switch.dart';

import '../../../common/common_colors.dart';
import '../../../common/common_text.dart';
import '../../../common/common_text_style.dart';


Widget buildAccountItemSettings({
  required String text,
  required void Function() onPressed,
  bool? switchValue,
  void Function(bool)? onSwitchChanged,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: CommonColors.textformFillColor,
    ),
    child: ListTile(
      title: CommonText(
        text: text,
        style: CommonTextStyle.loginAccountStyle.copyWith(
          fontSize: 14,
          color: CommonColors.subHeafingBlackColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: switchValue != null
          ? CustomSwitch(
        value: switchValue,
        onChanged: onSwitchChanged!,
      )
          : Icon(
        Icons.arrow_forward_ios,
        color: CommonColors.subHeafingBlackColor,
        size: 16,
      ),
      onTap: onPressed,
    ),
  );
}