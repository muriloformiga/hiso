import 'package:flutter/cupertino.dart';
import 'package:hiso/core/widgets/input_text_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class InformationFormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InputTextWidget(
          text: AuthStrings.email,
          controller: emailController,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        InputTextWidget(
          text: AuthStrings.password,
          controller: passwordController,
          isObscure: true,
        ),
        InputTextWidget(
          text: AuthStrings.passwordRepeat,
          controller: passwordRepeatController,
          isObscure: true,
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
