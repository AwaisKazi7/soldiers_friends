import 'package:flutter/material.dart';

class CommonTextform extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? prefixImage;
  final IconData? suffixIcon;
  final String? suffixImage;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final VoidCallback? onPrefixIconTap;
  final VoidCallback? onSuffixIconTap;
  final bool centerText;
  final bool isUnderline;
  Function(String)? onChanged;
  CommonTextform({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.prefixImage,
    this.suffixIcon,
    this.suffixImage,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.validator,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 10,
    this.onPrefixIconTap,
    this.onSuffixIconTap,
    this.centerText = false,
    this.isUnderline = true,
    this.onChanged = null,
  });

  Widget? _buildPrefix() {
    if (prefixIcon != null) {
      return GestureDetector(
        onTap: onPrefixIconTap,
        child: Icon(prefixIcon),
      );
    } else if (prefixImage != null) {
      return GestureDetector(
        onTap: onPrefixIconTap,
        child: Image.asset(prefixImage!),
      );
    }
    return null;
  }

  Widget? _buildSuffix() {
    if (suffixIcon != null) {
      return GestureDetector(
        onTap: onSuffixIconTap,
        child: Icon(suffixIcon),
      );
    } else if (suffixImage != null) {
      return GestureDetector(
        onTap: onSuffixIconTap,
        child: Image.asset(suffixImage!),
      );
    }
    return null;
  }

  InputBorder _buildInputBorder() {
    if (isUnderline) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.grey),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor ?? Colors.grey),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged ?? (value) {},
      keyboardType: textInputType,
      textInputAction: textInputAction,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
        prefixIcon: _buildPrefix(),
        suffixIcon: _buildSuffix(),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
      style: textStyle,
    );
  }
}
