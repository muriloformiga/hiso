import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_options_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.verdeHiso,
            AppColors.hawkesBlue,
            AppColors.azulHiso,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Image(
                      height: 130.h,
                      image: AssetImage(AppImages.logo),
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => CoordinatorProvider.instance
                              .get<AuthCoordinator>()
                              .goToHome(state.userId),
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
                  Container(
                    margin: EdgeInsets.all(50.h),
                    child: LoginFormWidget(),
                  ),
                  LoginOptionsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
