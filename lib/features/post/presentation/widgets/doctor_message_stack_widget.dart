import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/post/utils/post_strings.dart';

class DoctorMessageStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 280.w,
            child: Container(
              margin: EdgeInsets.only(bottom: 45.h, top: 20.h, right: 20.w),
              decoration: BoxDecoration(
                color: AppColors.blue[400],
                borderRadius: BorderRadius.circular(22),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.black.withOpacity(.25),
                    blurRadius: 3,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(25.w, 14.h, 29.w, 28.h),
                child: Text(PostStrings.doctorMessage),
              ),
            ),
          ),
        ),
        Positioned(
          left: -95.w,
          child: Image.asset(
            AppImages.doctorMan,
            height: 220.h,
          ),
        ),
      ],
    );
  }
}
