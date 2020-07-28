import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_colors.dart';

class RoundedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(250),
        ),
        color: AppColors.orange,
      ),
    );
  }
}
