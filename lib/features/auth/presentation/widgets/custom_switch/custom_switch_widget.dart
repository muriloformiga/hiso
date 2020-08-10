import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class CustomSwitchWidget extends StatefulWidget {
  CustomSwitchWidget({
    @required this.onTap,
  });

  final void Function(String value) onTap;

  @override
  _CustomSwitchWidgetState createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool _selected = true;
  final _duration = Duration(milliseconds: 150);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 200.w,
          height: 186.h,
          child: Image.asset(AppImages.doctors),
        ),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
            final result =
                _selected ? AuthStrings.relative : AuthStrings.professional;
            return widget.onTap(result);
          },
          child: AnimatedContainer(
            duration: _duration,
            height: 32.h,
            width: 196.w,
            decoration: BoxDecoration(
              color: _selected ? AppColors.gray[300] : AppColors.gray[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedAlign(
                  duration: _duration,
                  alignment:
                      _selected ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    height: 28.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.gray.withOpacity(0.3),
                          offset: Offset(1.h, 1.w),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          child: Text(AuthStrings.professional),
                          style: _selected
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                )
                              : TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black,
                                ),
                          duration: _duration,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          child: Text(AuthStrings.relative),
                          style: !_selected
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                )
                              : TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black,
                                ),
                          duration: _duration,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
