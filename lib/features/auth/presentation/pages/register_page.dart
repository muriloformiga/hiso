import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/register_form_widget.dart';

class RegisterPage extends StatelessWidget {
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
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => AuthNavigator.goToHome(),
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
