import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_colors.dart';

class OtpContainer extends StatefulWidget {
  final int length;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  OtpContainer({
    this.length = 4,
    required this.onChanged,
    this.keyboardType = TextInputType.number,
  });

  @override
  _OtpContainerState createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer> {
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];
  final List<String> _otp = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
      _otp.add('');
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => Container(
          height: 69.74,
          width: 69.74,
          decoration: BoxDecoration(
            color: CommonColors.darkGreen.withOpacity(0.3),
            border: Border.all(color: CommonColors.darkGreen),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              keyboardType: widget.keyboardType,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: Colors
                    .transparent, // Set fillColor to transparent, as it's handled by the Container
                counterText: '',
                border: InputBorder
                    .none, // Remove the internal border to avoid overlap with the Container's border
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < widget.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  }
                }
                setState(() {
                  _otp[index] = value;
                });
                widget.onChanged(_otp.join());
              },
            ),
          ),
        ),
      ),
    );
  }
}
