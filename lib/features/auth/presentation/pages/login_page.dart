import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
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
    return Scaffold(
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
                            .goToHome(),
                      );
                    } else if (state is LoginFailure) {
                      return Text(
                        state.message,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is LoginLoadInProgress) {
                      return Text(
                        'Carregando...',
                        textAlign: TextAlign.center,
                      );
                    }
                    return Text(
                      AuthStrings.welcomeMessage,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                CustomTextWidget(
                  text: AuthStrings.signInMessage,
                  fontSize: 20.h,
                  paddingValue: 10.h,
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
