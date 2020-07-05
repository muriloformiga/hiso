import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/presentation/widgets/register_form_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/ui/dimensoes_tela.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                AppImages.logo,
                height: 150.h,
              ),
              CustomTextWidget(
                text: AuthStrings.createAccountMessage,
                fontSize: 20.h,
                paddingValue: 10.h,
              ),
              CustomTextWidget(
                text: AuthStrings.coolTextRecipe,
                fontSize: 16.h,
                paddingValue: 10.h,
              ),
              Divider(),
              RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
