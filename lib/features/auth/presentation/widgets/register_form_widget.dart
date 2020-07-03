import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CupertinoTextField(
          placeholder: 'Nome',
        ),
        CupertinoTextField(
          placeholder: 'E-mail',
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoTextField(
          placeholder: 'Senha',
        ),
        CupertinoTextField(
          placeholder: 'Repita a Senha',
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoButton.filled(
          child: Text('Cadastrar'),
          onPressed: () {},
        ),
      ],
    );
  }
}
