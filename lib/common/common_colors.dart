import 'package:flutter/material.dart';

class CommonColors {
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF353535);
  static const Color secoundryColor = Color(0xFFE9ECEF);
  static const Color lightGray = Color(0xFFEEEEEE);
  static const Color darkGreen = Color(0xFF3C866D);
  static const Color neutralGray = Color(0xFF999999);
  static const Color blackColor = Color(0xFF000000);
  static const Color dotColor = Color(0xFFFFBA00);

  // Gradient colors
  static const Color gradientStartColor = Color(0xFF5ECA95);
  static const Color gradientEndColor = Color(0xFF1AADD5);

  // Linear Gradient for buttons
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [gradientStartColor, gradientEndColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static Shader createGradientShader(Rect bounds) {
    return buttonGradient.createShader(bounds);
  }
}
