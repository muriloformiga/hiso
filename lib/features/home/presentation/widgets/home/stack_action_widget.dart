import 'package:flutter/material.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/home/navigator/home_navigator.dart';

class StackActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80.h,
          color: AppColors.blue,
        ),
        Align(
          alignment: Alignment(0.8, 0.5),
          heightFactor: 2.55.h,
          child: FloatingActionButton.extended(
            label: Text('Cadastrar'),
            icon: Icon(Icons.add),
            onPressed: () => HomeNavigator.goToPost(),
          ),
        ),
      ],
    );
  }
}
