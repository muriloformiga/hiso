import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/widgets/custom_text_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

class PresentationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.gray,
            Color(0xFFcfe3fc),
            AppColors.blue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    AppImages.doctor,
                    height: 80,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextWidget(
                    text: AuthStrings.provideInfoMessage,
                    fontSize: 16.h,
                    paddingValue: 20.h,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    AppImages.man,
                    height: 80.h,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextWidget(
                    text: AuthStrings.getInfoMessage,
                    fontSize: 16.h,
                    paddingValue: 20.h,
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
      ),
    );
  }
}
