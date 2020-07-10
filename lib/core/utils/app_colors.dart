import 'package:flutter/material.dart';

class AppColors {
  static const Color coral = Color(0xFFEE716E);
  static const Color coralLight = Color(0xFFE89388);
  static const Color verdeCaribe = Color(0xFF0BBA94);
  static const Color verdeSombra = Color(0x4B0BBA94);
  static const Color preto = Colors.black;
  static const Color branco = Colors.white;
  static const Color azulFacebook = Color(0xFF2A64B2);
  static const Color vermelhoGoogle = Color(0xFFEB3838);
  static const Color roxo = Color(0xFF8836B8);
  static const Color laranja = Colors.orange;
  static const Color azulArdosia = Color(0xFF564DD6);
  static const Color azulReal = Color(0xFF3B7CE4);
  static const Color verdePastel = Color(0xFF21B54B);
  static const Color verdeBanese = Color(0xFF00BC72);
  static const Color verdeMusgo = Color(0xFF00AE5F);
  static const Color rosaAmoreira = Color(0xFFDE4D94);
  static const Color amareloOuro = Color(0xFFDFAD2C);
  static const Color roxoOrquideaNegra = Color(0xFF8836B8);
  static const Color transparente = Colors.transparent;
  static const Color azulHiso = Color(0xFF78d0e5);
  static const Color verdeHiso = Color(0xFF4ce6be);
  // CFE3FC 9156EC F49E6F 157FFB FC1441 30A64A 6D757D

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

  static final List<Color> gradienteBanese = <Color>[
    Color(0xFF2D9D6D),
    Color(0xFF2fc498),
  ];

  static final List<Color> gradienteInstagram = <Color>[
    Color(0xFFFFC107),
    Color(0xFFF44336),
    Color(0xFF9C27B0),
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
