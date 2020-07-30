import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';

abstract class AppGradients {
  static final bottomGreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.gray,
      AppColors.green[200],
    ],
    stops: [0.5, 1],
  );
}
