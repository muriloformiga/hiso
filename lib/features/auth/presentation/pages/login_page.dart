import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/strings/strings.dart';
import 'package:hiso/features/auth/presentation/bloc/login_bloc.dart';
import 'package:hiso/features/auth/presentation/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/login_options_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Image(
                  height: 130,
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
                    Strings.welcomeMessage,
                    textAlign: TextAlign.center,
                  );
                },
              ),
              LoginFormWidget(),
              LoginOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
