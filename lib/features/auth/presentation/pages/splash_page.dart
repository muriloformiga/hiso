import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/bloc/splash/splash_cubit.dart';
import 'package:hiso/features/auth/presentation/widgets/splash/rounded_box_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashUserIsLoggedIn) {
          AuthNavigator.goToHome();
        }
        if (state is SplashUserIsNotLoggedIn) {
          AuthNavigator.goToLogin();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,
              AppColors.green[200],
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: Container(
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
                    child: Container(
                      width: 466.w,
                      height: 336.h,
                      child: Image.asset(
                        AppImages.family,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RoundedBoxWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
