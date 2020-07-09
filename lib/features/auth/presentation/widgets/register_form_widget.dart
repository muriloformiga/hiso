import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class RegisterFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CupertinoTextField(
          controller: emailController,
          placeholder: AuthStrings.email,
        ),
        SizedBox(
          height: 10.h,
        ),
        CupertinoTextField(
          controller: passwordController,
          placeholder: AuthStrings.password,
          obscureText: true,
        ),
        CupertinoTextField(
          controller: passwordRepeatController,
          placeholder: AuthStrings.passwordRepeat,
          obscureText: true,
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
              ),
            );
          },
        ),
      ],
    );
  }
}
