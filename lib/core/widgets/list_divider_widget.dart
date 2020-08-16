import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class ListDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Divider(
        height: 1.h,
        indent: 10.w,
        endIndent: 10.w,
      ),
    );
  }
}
