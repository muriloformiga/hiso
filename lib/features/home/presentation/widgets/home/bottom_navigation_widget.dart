import 'package:flutter/cupertino.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/home/navigator/home_navigator.dart';

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 70.w,
        vertical: 23.h,
      ),
      color: AppColors.white,
      height: 100.h,
      child: CupertinoButton.filled(
        padding: EdgeInsets.zero,
        child: Text('Cadastrar Paciente'),
        onPressed: () => HomeNavigator.goToPost(),
      ),
    );
  }
}
