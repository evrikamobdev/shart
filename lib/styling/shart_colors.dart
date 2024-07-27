import 'package:flutter/material.dart';

class ShartColors {
  static const Color primaryColor = Color(0xFF047857);
  static const Color lightPrimaryColor = Color.fromRGBO(218, 235, 230, 1);
  static const Color neutral = Color.fromRGBO(156, 165, 172, 1);
  static const Color neutralBlack = Color.fromRGBO(34, 34, 34, 1);
  static const Color neutral2 = Color.fromRGBO(96, 101, 108, 1);
  static const Color neutral3 = Color.fromRGBO(156, 165, 172, 1);

  static const Color black = Colors.black;
  static final Color white = Color.fromRGBO(255, 255, 255, 1);

  static final MaterialColor themePrimaryColor = MaterialColor(
    0xff047857,
    const <int, Color>{
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    },
  );
}
