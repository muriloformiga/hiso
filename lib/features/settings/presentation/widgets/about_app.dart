import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/app_strings.dart';
import 'package:hiso/core/utils/sizes.dart';

abstract class AboutApp {
  static void showAboutDialog({@required BuildContext context}) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return AboutDialog(
          applicationName: AppStrings.appName,
          applicationIcon: Image.asset(
            AppImages.logo,
            height: 90.h,
          ),
          applicationVersion: AppStrings.appVersion,
          applicationLegalese: AppStrings.appLegalize,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Text(
                AppStrings.appDescription,
              ),
            ),
          ],
        );
      },
    );
  }
}
