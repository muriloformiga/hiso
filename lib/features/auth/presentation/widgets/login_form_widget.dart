import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/login_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/register_page.dart';

class LoginFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CupertinoTextField(
          placeholder: 'E-mail',
          controller: emailController,
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoTextField(
          placeholder: 'Senha',
          controller: passwordController,
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoButton.filled(
          child: Text('Enviar'),
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(
              LoginEmailStarted(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
        ),
        CupertinoButton(
          child: Text('Cadastrar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
