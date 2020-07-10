import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class LoginFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 329.w,
            height: 51.h,
            child: CupertinoTextField(
              textAlign: TextAlign.start,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              placeholder: AuthStrings.email,
              controller: emailController,
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Container(
            width: 329.w,
            height: 51.h,
            child: CupertinoTextField(
              textAlign: TextAlign.start,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              placeholder: AuthStrings.password,
              controller: passwordController,
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CupertinoButton.filled(
            child: Text(AuthStrings.send),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(
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
            onPressed: () => CoordinatorProvider.instance
                .get<AuthCoordinator>()
                .goToPresentation(),
          ),
        ],
      ),
    );
  }
}
