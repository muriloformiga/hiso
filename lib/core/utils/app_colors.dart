import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color blueAccent = Colors.blueAccent;
  static const Color orange = Color(0xFFFF6A38);

  static const Color azulFacebook = Color(0xFF2A64B2);
  static const Color vermelhoGoogle = Color(0xFFEB3838);
  static const Color roxo = Color(0xFF8836B8);

  static const Color seaGreen = Color(0xFF30A64A);
  static const Color torchRed = Color(0xFFFC1441);
  static const Color dodgerBlue = Color(0xFFCFE3FC);
  static const Color sandyBrown = Color(0xFFFBD8C5);
  static const Color mediumPurple = Color(0xFF9156EC);

  static const MaterialColor cinza = MaterialColor(
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

  static const MaterialColor azul = MaterialColor(
    0xFF3CFFEB,
    <int, Color>{
      0: Color(0xFF35F2DF),
      10: Color(0xFF35DFF2),
      50: Color(0xFF3BD9F5),
      100: Color(0xFF37B8F5),
      200: Color(0xFF3C94F5),
    },
  );

  static const MaterialColor verde = MaterialColor(
    0xFF3FF5B6,
    <int, Color>{
      0: Color(0xFF35F29A),
      10: Color(0xFF00A880),
      50: Color(0xFF197349),
      100: Color(0xFF082618),
      200: Color(0xFF061C12),
    },
  );

  static const MaterialColor laranja = MaterialColor(
    0xFFFF8359,
    <int, Color>{
      0: Color(0xFFFF6A38),
      10: Color(0xFFF26535),
      50: Color(0xFFD95A30),
      100: Color(0xFFB34A27),
      200: Color(0xFF73301),
    },
  );

  static final List<Color> gradienteBanese = <Color>[
    Color(0xFF2D9D6D),
    Color(0xFF2fc498),
  ];

  static final List<Color> gradienteApple = <Color>[
    Color(0xFF3E3E3E),
    Color(0xFF000000),
    Color(0xFF000000),
  ];
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    String _hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (_hexColor.length == 6) {
      _hexColor = 'FF' + _hexColor;
    }
    return int.parse(_hexColor, radix: 16);
  }
}
