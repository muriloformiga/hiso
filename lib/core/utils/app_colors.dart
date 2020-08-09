import 'package:flutter/material.dart';

abstract class AppColors {
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color red = Colors.red;
  static Color transparent = Colors.transparent;
  static Color salmon = Color(0xFFf6af94);

  static const gray = MaterialColor(
    0xFFF5FFFB,
    <int, Color>{
      100: Color(0xFFE9F2EE),
      200: Color(0xFFF7F7FA),
      300: Color(0xFFD0D9D5),
      400: Color(0xFFABB3B0),
      500: Color(0xFF9A99A2),
      600: Color(0xFF6E7371),
      700: Color(0xFF0D0D0D),
    },
  );

  static const blue = MaterialColor(
    0xFF3CFFEB,
    <int, Color>{
      100: Color(0xFF35F2DF),
      200: Color(0xFF35DFF2),
      300: Color(0xFF3BD9F5),
      400: Color(0xFF37B8F5),
      500: Color(0xFF3C94F5),
    },
  );

  static const green = MaterialColor(
    0xFF3FF5B6,
    <int, Color>{
      100: Color(0xFF35F29A),
      200: Color(0xFF00A880),
      300: Color(0xFF197349),
      400: Color(0xFF082618),
      500: Color(0xFF061C12),
    },
  );

  static const orange = MaterialColor(
    0xFFFF8359,
    <int, Color>{
      100: Color(0xFFFF6A38),
      200: Color(0xFFF26535),
      300: Color(0xFFD95A30),
      400: Color(0xFFB34A27),
      500: Color(0xFF733019),
    },
  );
}
