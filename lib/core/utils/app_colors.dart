import 'package:flutter/material.dart';

class AppColors {
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color transparent = Color(0x00000000);

  static const gray = MaterialColor(
    0xFFF3F3F3,
    <int, Color>{
      0: Color(0xFFFFFFFF),
      10: Color(0xFFEFEFEF),
      50: Color(0xFFE1E1E1),
      100: Color(0xFFF3F3F3),
      200: Color(0xFFE8E8E8),
      250: Color(0xFFDBDBDB),
      300: Color(0xFFDCDCDC),
      350: Color(0xFFEDEDED),
      400: Color(0xFFBEBEBE),
      450: Color(0xFFB1B1B1),
      500: Color(0xFF949494),
      550: Color(0xFF969696),
      590: Color(0xFF999999),
      600: Color(0xFF757575),
      650: Color(0xFF656565),
    },
  );

  static const blue = MaterialColor(
    0xFF3CFFEB,
    <int, Color>{
      0: Color(0xFF35F2DF),
      10: Color(0xFF35DFF2),
      50: Color(0xFF3BD9F5),
      100: Color(0xFF37B8F5),
      200: Color(0xFF3C94F5),
    },
  );

  static const green = MaterialColor(
    0xFF3FF5B6,
    <int, Color>{
      0: Color(0xFF35F29A),
      10: Color(0xFF00A880),
      50: Color(0xFF197349),
      100: Color(0xFF082618),
      200: Color(0xFF061C12),
    },
  );

  static const orange = MaterialColor(
    0xFFFF8359,
    <int, Color>{
      0: Color(0xFFFF6A38),
      10: Color(0xFFF26535),
      50: Color(0xFFD95A30),
      100: Color(0xFFB34A27),
      200: Color(0xFF73301),
    },
  );
}
