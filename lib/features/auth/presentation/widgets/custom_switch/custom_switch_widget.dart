import 'package:flutter/material.dart';
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
    return GestureDetector(
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
          color: _selected ? AppColors.sandyBrown : AppColors.dodgerBlue,
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
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.3),
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
                              color: AppColors.black,
                            )
                          : TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blueAccent,
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
                              color: AppColors.black,
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
    );
  }
}
