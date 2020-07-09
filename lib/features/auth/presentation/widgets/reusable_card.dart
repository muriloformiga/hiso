import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 179.w,
        height: 131.h,
        padding: EdgeInsets.all(5.0.w),
        child: cardChild,
        margin: EdgeInsets.all(10.0.w),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
