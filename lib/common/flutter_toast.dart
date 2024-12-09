import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soldiers_friends/common/common_colors.dart';

class FlutterToastDisplay {
  static FlutterToastDisplay? _instance;
  static FlutterToastDisplay get getInstance =>
      _instance ??= FlutterToastDisplay();

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: CommonColors.gradientStartColor,
        textColor: Color(0xFFFFFFFF),
        fontSize: 14.0);
  }
}
