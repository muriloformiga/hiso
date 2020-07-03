import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Baseado no InVision design
const double _guidelineBaseWidth = 375;

double scale({@required double size, @required BuildContext context}) {
  assert(size != null);
  assert(context != null);
  return (MediaQuery.of(context).size.width / _guidelineBaseWidth) * size;
}

double moderateScale({
  @required double size,
  @required BuildContext context,
  double factor = 0.5,
}) {
  assert(size != null);
  assert(context != null);
  assert(factor != null);
  return size + (scale(size: size, context: context) - size) * factor;
}
