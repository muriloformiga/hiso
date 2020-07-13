import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_switch.dart';
import 'package:hiso/features/auth/presentation/widgets/imput_decorated_widget.dart';
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
        CustomSwitch(value: false),
        ImputDecoratedWidget(
          controller: emailController,
          placeholder: AuthStrings.email,
        ),
        ImputDecoratedWidget(
          controller: nameController,
          placeholder: AuthStrings.name,
        ),
        ImputDecoratedWidget(
          controller: accountTypeController,
          placeholder: AuthStrings.accountType,
        ),
        ImputDecoratedWidget(
          controller: phoneController,
          placeholder: AuthStrings.phone,
        ),
        SizedBox(
          height: 10.h,
        ),
        ImputDecoratedWidget(
          controller: passwordController,
          placeholder: AuthStrings.password,
          isHideText: true,
        ),
        ImputDecoratedWidget(
          controller: passwordRepeatController,
          placeholder: AuthStrings.passwordRepeat,
          isHideText: true,
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
