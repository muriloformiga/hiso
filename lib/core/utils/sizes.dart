import 'dart:math';

import 'package:flutter/material.dart';

abstract class Sizes {
  static double get _targetHeight => 812;
  static double get _targetWidth => 375;

  static double get width {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  }

  static double get height {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .size
        .height;
  }

  static double get textScaleFactor {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .textScaleFactor;
  }

  static double get widthScale => width / _targetWidth;

  static double get heightScale => height / _targetHeight;

  static double get textScale => widthScale;

  static double get statusBarHeight =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

  static double get bottomBarHeight =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.bottom;

  static double get maxLength {
    return max(height, width);
  }

  static double get minLength {
    return min(height, width);
  }

  static double scaleHeight(double height) {
    return height * heightScale;
  }

  static double scaleWidth(double width) {
    return width * widthScale;
  }

  static double setFonte(double fontSize, {bool autoScale = false}) {
    if (autoScale) {
      return fontSize * textScale;
    }
    return (fontSize * textScale) / textScaleFactor;
  }
}

extension DimensoesTelaExtension on num {
  double get h => Sizes.scaleHeight(toDouble());
  double get w => Sizes.scaleWidth(toDouble());
  double get sp => Sizes.setFonte(toDouble());
  double get ssp => Sizes.setFonte(toDouble(), autoScale: true);
}
