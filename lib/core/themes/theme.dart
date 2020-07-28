import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/sizes.dart';

class Themes {
  static final hisoTheme = ThemeData(
    //primarySwatch: Colors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.blue,
      elevation: 0,
    ),
    fontFamily: 'Questrial',
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
        fontFamily: 'Hind',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: AppColors.gray,
        ),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(32),
      //   borderSide: BorderSide(
      //     color: AppColors.mediumPurple,
      //   ),
      // ),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.orange,
      elevation: 1,
    ),
  );
}
