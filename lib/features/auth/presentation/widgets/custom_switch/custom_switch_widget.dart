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
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 170.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.doctor),
            ),
          ],
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
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: 60.h,
            width: 320.w,
            decoration: BoxDecoration(
              color: _selected ? AppColors.blue : AppColors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedAlign(
                  duration: _duration,
                  alignment:
                      _selected ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(50),
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
                          child: Text(AuthStrings.relative),
                          style: _selected
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gray,
                                )
                              : TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blue,
                                ),
                          duration: _duration,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          child: Text(AuthStrings.professional),
                          style: !_selected
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gray,
                                )
                              : TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.orange,
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
