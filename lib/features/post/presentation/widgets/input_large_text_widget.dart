import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/post/utils/post_strings.dart';

class InputLargeTextWidget extends StatelessWidget {
  InputLargeTextWidget({
    @required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.black.withOpacity(.25),
            blurRadius: 3,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        scrollPhysics: BouncingScrollPhysics(),
        maxLines: 6,
        //maxLength: 1000,
        maxLengthEnforced: false,
        decoration: InputDecoration(
          //counterText: '',
          fillColor: AppColors.white,
          hintText: PostStrings.summaryHint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.h,
              color: AppColors.orange[400],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.h,
              color: AppColors.gray[100],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
