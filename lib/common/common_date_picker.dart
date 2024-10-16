import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? prefixImage;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final bool isUnderline;
  final ValueChanged<DateTime> onDateSelected; // Callback for the selected date
  final DateTime? selectedDate; // Selected date passed from the parent

  const DatePickerWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.prefixImage,
    required this.controller,
    this.validator,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 10,
    this.isUnderline = true,
    required this.onDateSelected, // Required callback parameter
    this.selectedDate, // Selected date parameter
  }) : super(key: key);

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Use passed date or now
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0]; // Format date as needed
      onDateSelected(picked); // Call the callback with the selected DateTime
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: validator,
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            border: _buildInputBorder(),
            enabledBorder: _buildInputBorder(),
            focusedBorder: _buildInputBorder(),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon)
                : (prefixImage != null ? Image.asset(prefixImage!) : null),
            suffixIcon: Icon(Icons.calendar_today), // Date icon at the end
            hintText: hintText,
            hintStyle: hintStyle,
          ),
          style: textStyle,
        ),
      ),
    );
  }
}
