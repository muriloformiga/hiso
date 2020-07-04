import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/register_form_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                AppImages.logo,
                height: 150,
              ),
              CustomTextWidget(
                text: AuthStrings.createAccountMessage,
                fontSize: 20,
                paddingValue: 10,
              ),
              CustomTextWidget(
                text: AuthStrings.provideInfoMessage,
                fontSize: 16,
                paddingValue: 10,
              ),
              RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
