import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.controller,
    @required this.placeholder,
    @required this.validator,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String placeholder;
  final Function(String) validator;
  final TextInputType inputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          gapPadding: 20.w,
        ),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
