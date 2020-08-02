import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class LoginSwitchWidget extends StatefulWidget {
  LoginSwitchWidget({
    Key key,
    @required this.onTap,
  }) : super(key: key);
  final void Function(String value) onTap;
  @override
  _LoginSwitchWidgetState createState() => _LoginSwitchWidgetState();
}

class _LoginSwitchWidgetState extends State<LoginSwitchWidget> {
  bool _selected = true;
  final _duration = Duration(milliseconds: 150);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
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
                        child: Text(AuthStrings.send),
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
                        child: Text(AuthStrings.register),
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
    );
  }
}
