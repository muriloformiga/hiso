import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_colors.dart';
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
          InputTextWidget(
            controller: passwordController,
            text: AuthStrings.password,
            isObscure: true,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CupertinoButton.filled(
            child: Text(
              AuthStrings.send,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
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
          SizedBox(
            height: 30.0.h,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.only(left: 42.w, right: 42.w),
              color: AppColors.transparent,
              child: Text(
                AuthStrings.register,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange[400],
                ),
              ),
              onPressed: () => AuthNavigator.goToPresentation(),
            ),
          ),
          SizedBox(
            height: 40.0.h,
          ),
        ],
      ),
    );
  }
}
