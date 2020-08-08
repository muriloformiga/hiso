import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class PacientTileWidget extends StatelessWidget {
  PacientTileWidget({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
    @required this.birthDate,
  });

  final String name;
  final String lastName;
  final String hospital;
  final String birthDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$name $lastName',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            hospital,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'Data Nasc. $birthDate',
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
