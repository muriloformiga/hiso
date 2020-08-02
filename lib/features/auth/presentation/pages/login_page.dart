import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_options_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_switch/login_switch_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.green,
            AppColors.gray,
            AppColors.gray,
          ],
          stops: [0, 0.5, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Image(
                    height: 149.h,
                    image: AssetImage(AppImages.logo),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          User.instance.setId(state.authUser.firebaseUser.uid);
                          User.instance
                              .setEmail(state.authUser.firebaseUser.email);
                          AuthNavigator.goToHome();
                        },
                      );
                    } else if (state is LoginFailure) {
                      return Text(
                        AuthStrings.welcomeMessage,
                        textAlign: TextAlign.center,
                      );
                    }
                    return Container();
                  },
                ),
                CustomTextWidget(
                  text: AuthStrings.signInMessage,
                  fontSize: 20.h,
                  paddingValue: 10.h,
                ),
                LoginSwitchWidget(
                  onTap: (String value) {},
                ),
                LoginFormWidget(),
                LoginOptionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
