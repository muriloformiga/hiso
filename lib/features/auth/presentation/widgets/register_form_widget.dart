import 'package:flutter/cupertino.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class RegisterFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CupertinoTextField(
          placeholder: AuthStrings.name,
        ),
        CupertinoTextField(
          placeholder: AuthStrings.email,
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoTextField(
          placeholder: AuthStrings.password,
        ),
        CupertinoTextField(
          placeholder: AuthStrings.passwordRepeat,
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoButton.filled(
          child: Text(AuthStrings.register),
          onPressed: () {},
        ),
      ],
    );
  }
}
