import 'package:flutter/cupertino.dart';
import 'package:hiso/features/auth/presentation/widgets/imput_decorated_widget.dart';
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
        ImputDecoratedWidget(
          placeholder: AuthStrings.email,
          controller: emailController,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        ImputDecoratedWidget(
          placeholder: AuthStrings.password,
          controller: passwordController,
          isHideText: true,
        ),
        ImputDecoratedWidget(
          placeholder: AuthStrings.passwordRepeat,
          controller: passwordRepeatController,
          isHideText: true,
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
