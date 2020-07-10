import 'package:flutter/cupertino.dart';
import 'package:hiso/core/utils/sizes.dart';

class SocialButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final String icon;

  SocialButtonWidget({
    @required this.onPressed,
    @required this.text,
    @required this.color,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Image.asset(
          icon,
        ),
        borderRadius: BorderRadius.circular(20),
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
