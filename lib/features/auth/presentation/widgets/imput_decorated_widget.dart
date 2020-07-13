import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';

class ImputDecoratedWidget extends StatelessWidget {
  const ImputDecoratedWidget({
    Key key,
    @required this.controller,
    @required this.placeholder,
    this.isHideText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;
  final bool isHideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329.w,
      height: 51.h,
      margin: EdgeInsets.only(bottom: 2.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 2),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        obscureText: isHideText,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: placeholder,
        ),
        controller: controller,
      ),
    );
  }
}
