import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    @required this.text,
    @required this.fontSize,
    this.paddingValue = 0,
  });

  final double paddingValue;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingValue),
      child: Container(
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontFamily: 'Questrial',
          ),
        ),
      ),
    );
  }
}
