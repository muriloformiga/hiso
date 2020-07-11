import 'package:flutter/cupertino.dart';
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
        CupertinoTextField(
          controller: emailController,
          placeholder: AuthStrings.email,
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
