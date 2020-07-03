import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    @required this.text,
    @required this.fontSize,
    @required this.paddingValue,
  });

  final double paddingValue;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontFamily: 'Georgia',
          ),
        ),
      ),
    );
  }
}
