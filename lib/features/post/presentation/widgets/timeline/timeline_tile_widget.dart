import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class TimelineTileWidget extends StatelessWidget {
  TimelineTileWidget({
    @required this.date,
    @required this.hour,
    @required this.message,
  });

  final String date;
  final String hour;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 25.h, 15.w, 15.h),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(message),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Text(
              '$date • $hour',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.gray[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
