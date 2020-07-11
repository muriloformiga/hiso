import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class RegisterFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final nameController = TextEditingController();
  final accountTypeController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Container(
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
              controller: emailController,
              placeholder: AuthStrings.email,
            ),
          ),
        ),
        CupertinoTextField(
          controller: nameController,
          placeholder: AuthStrings.name,
        ),
        CupertinoTextField(
          controller: accountTypeController,
          placeholder: AuthStrings.accountType,
        ),
        CupertinoTextField(
          controller: phoneController,
          placeholder: AuthStrings.phone,
        ),
        SizedBox(
          height: 10.h,
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
            controller: passwordController,
            placeholder: AuthStrings.password,
            obscureText: true,
          ),
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
            controller: passwordRepeatController,
            placeholder: AuthStrings.passwordRepeat,
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CupertinoButton.filled(
          child: Text(AuthStrings.register),
          onPressed: () {
            BlocProvider.of<RegisterBloc>(context).add(
              RegisterEmailStarted(
                email: emailController.text,
                password: passwordController.text,
                passwordRepeat: passwordRepeatController.text,
                name: nameController.text,
                accountType: accountTypeController.text,
                phone: phoneController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}
