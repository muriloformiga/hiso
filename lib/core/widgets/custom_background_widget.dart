import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/features/auth/presentation/widgets/splash/rounded_box_widget.dart';

class CustomBackgroundWidget extends StatelessWidget {
  CustomBackgroundWidget({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.whiteToGreen,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: RoundedBoxWidget(),
                ),
              ),
              Expanded(
                flex: 3,
                child: child,
              ),
              Expanded(
                flex: 1,
                child: RoundedBoxWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
