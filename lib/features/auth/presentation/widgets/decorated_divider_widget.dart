import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class DecoratedDividerWidget extends StatelessWidget {
  const DecoratedDividerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                height: 2.h,
              ),
            ),
            Container(
              height: 20.h,
              width: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.gray[400],
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                'ou',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            Expanded(
              child: Divider(
                height: 2.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
