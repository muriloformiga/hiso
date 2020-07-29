import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/post/utils/post_strings.dart';

class DoctorMessageStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 20.h),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 223.w,
              child: Card(
                color: AppColors.blue[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(13.w, 14.h, 29.w, 28.h),
                  child: Text(PostStrings.doctorMessage),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              AppImages.doctorMan,
              height: 193.h,
            ),
          ),
        ],
      ),
    );
  }
}
