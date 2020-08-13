import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:hiso/features/post/navigator/post_navigator.dart';

class PacientTileWidget extends StatelessWidget {
  PacientTileWidget({
    @required this.pacient,
  });

  final Pacient pacient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      color: AppColors.white,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => PostNavigator.goToTimeline(pacient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${pacient.name} ${pacient.lastName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              pacient.hospital,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Data Nasc. ${pacient.birthDate}',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
