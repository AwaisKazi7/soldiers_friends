import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:soldiers_friends/common/common_colors.dart';

class SmallLoader extends StatelessWidget {
  const SmallLoader({
    Key? key,
    this.adaptive = false,
    this.color,
  }) : super(key: key);
  final bool adaptive;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    
    return adaptive
        ? Platform.isIOS
            ? Center(
              child: CupertinoActivityIndicator(
                  color: color ?? CommonColors.primaryColor,
                ),
            )
            : Center(
              child: SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      color ?? CommonColors.primaryColor,
                    ),
                  ),
                ),
            )
        : Center(
            child: SpinKitWanderingCubes(
              color: CommonColors.primaryColor,
              size: 20,
            ),
          );
  }
}