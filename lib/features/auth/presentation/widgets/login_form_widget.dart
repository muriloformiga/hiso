import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/widgets/input_text_widget.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class LoginFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InputTextWidget(
            controller: emailController,
            text: AuthStrings.email,
          ),
          SizedBox(
            height: 10.0.h,
          ),
          InputTextWidget(
            controller: passwordController,
            text: AuthStrings.password,
            isObscure: true,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CupertinoButton(
            child: Text(AuthStrings.send),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context)
                ..add(
                  LoginEmailStarted(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
            },
          ),
          SizedBox(height: 5.h),
          Text('ou'),
          CupertinoButton(
            child: Text(AuthStrings.register),
            onPressed: () => AuthNavigator.goToPresentation(),
          ),
        ],
      ),
    );
  }
}
