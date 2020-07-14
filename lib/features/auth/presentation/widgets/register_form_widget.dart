import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/register_card_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

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
      children: <Widget>[
        RegisterCardWidget(
          controller: [
            nameController,
            accountTypeController,
            phoneController,
          ],
          placeholder: [
            AuthStrings.name,
            AuthStrings.accountType,
            AuthStrings.phone,
          ],
        ),
        RegisterCardWidget(
          controller: [
            emailController,
            passwordController,
            passwordRepeatController,
          ],
          placeholder: [
            AuthStrings.email,
            AuthStrings.password,
            AuthStrings.passwordRepeat,
          ],
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
