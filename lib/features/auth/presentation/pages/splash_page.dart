import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/widgets/custom_background_widget.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/bloc/splash/splash_cubit.dart';

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
      child: CustomBackgroundWidget(
        child: Container(
          width: 466.w,
          height: 336.h,
          child: Image.asset(
            AppImages.family,
          ),
        ),
      ),
    );
  }
}
