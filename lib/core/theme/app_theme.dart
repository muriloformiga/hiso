import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

abstract class AppTheme {
  static final hisoTheme = ThemeData(
    fontFamily: 'SFPro',
    primaryColor: AppColors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.transparent,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.red,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.orange[400],
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.orange[400],
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 72.sp,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 36.sp,
        fontStyle: FontStyle.italic,
      ),
      bodyText2: TextStyle(
        fontSize: 14.sp,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.orange,
      elevation: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.h,
          color: AppColors.orange[400],
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.h,
          color: AppColors.gray[100],
        ),
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    ),
  );
}
