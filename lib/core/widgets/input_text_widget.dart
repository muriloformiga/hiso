import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class InputTextWidget extends StatelessWidget {
  InputTextWidget({
    @required this.controller,
    @required this.text,
    this.color = AppColors.gray,
    this.inputType = TextInputType.text,
  });

  final TextEditingController controller;
  final String text;
  final Color color;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: color,
        contentPadding: EdgeInsets.only(right: 20.w),
        prefixIconConstraints: BoxConstraints(maxHeight: 30.h),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(text),
        ),
      ),
    );
  }
}
