import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/register_form_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.green,
            AppColors.blue,
            AppColors.blue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomTextWidget(
                  text: AuthStrings.createAccountMessage,
                  fontSize: 20.h,
                  paddingValue: 10.h,
                ),
                CustomTextWidget(
                  text: AuthStrings.coolTextRecipe,
                  fontSize: 16.h,
                  paddingValue: 10.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => CoordinatorProvider.instance
                            .get<AuthCoordinator>()
                            .goToHome(state.authUser.firebaseUser),
                      );
                    } else if (state is RegisterFailure) {
                      return Text(
                        state.message,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is RegisterLoadInProgress) {
                      return Text(
                        'Carregando...',
                        textAlign: TextAlign.center,
                      );
                    }
                    return Container();
                  },
                ),
                Divider(),
                RegisterFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
