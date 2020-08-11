import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/register_card_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_switch/custom_switch_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class RegisterFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final crmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String accountTypeSelected = AuthStrings.relative;
    return Column(
      children: <Widget>[
        CustomSwitchWidget(
          onTap: (value) {
            accountTypeSelected = value;
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        RegisterCardWidget(
          controller: {
            0: nameController,
            1: phoneController,
          },
          placeholder: {
            0: AuthStrings.name,
            1: AuthStrings.phone,
          },
        ),
        RegisterCardWidget(
          controller: {
            0: emailController,
            1: passwordController,
            2: passwordRepeatController,
          },
          placeholder: {
            0: AuthStrings.email,
            1: AuthStrings.password,
            2: AuthStrings.passwordRepeat,
          },
        ),
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterSuccess) {
              return RegisterCardWidget(
                controller: {
                  0: crmController,
                },
                placeholder: {
                  0: 'CRM',
                },
              );
            }
            return Container();
          },
        ),
        SizedBox(height: 10),
        CupertinoButton.filled(
          child: Text(AuthStrings.register),
          onPressed: () {
            BlocProvider.of<RegisterBloc>(context).add(
              RegisterEmailStarted(
                email: emailController.text,
                password: passwordController.text,
                passwordRepeat: passwordRepeatController.text,
                name: nameController.text,
                accountType: accountTypeSelected,
                phone: phoneController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}
