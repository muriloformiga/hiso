import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/components/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class PresentationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CustomTextWidget(
                  text: AuthStrings.createAccountMessage,
                  fontSize: 16,
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  AppImages.manDoctor,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomTextWidget(
                  text: AuthStrings.provideInfoMessage,
                  fontSize: 16,
                  paddingValue: 20,
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  AppImages.man,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomTextWidget(
                  text: AuthStrings.provideInfoMessage,
                  fontSize: 16,
                  paddingValue: 20,
                ),
              ),
              CupertinoButton.filled(
                child: Text(AuthStrings.nextStep),
                onPressed: () => CoordinatorProvider.instance
                    .get<AuthCoordinator>()
                    .goToRegister(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}