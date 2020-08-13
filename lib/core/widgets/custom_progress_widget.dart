import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';

class CustomProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.h,
      margin: EdgeInsets.all(15.h),
      child: FlareActor(
        'assets/animations/loading.flr',
        animation: 'clockwise',
      ),
    );
  }
}
