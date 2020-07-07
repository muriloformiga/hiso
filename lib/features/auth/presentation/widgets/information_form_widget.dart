import 'package:flutter/cupertino.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class InformationFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CupertinoTextField(
          placeholder: AuthStrings.email,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        CupertinoTextField(
          placeholder: AuthStrings.password,
          obscureText: true,
        ),
        CupertinoTextField(
          placeholder: AuthStrings.passwordRepeat,
          obscureText: true,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        CupertinoButton.filled(
          child: Text(AuthStrings.register),
          onPressed: () {},
        ),
      ],
    );
  }
}
