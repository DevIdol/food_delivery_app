import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor primaryColorSwatch =
      MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFA8FCE7),
    100: Color(0xFF94F4DC),
    200: Color(0xFF76D9C0),
    300: Color(0xFF019570),
    400: Color(0xFF018967),
    500: Color(_primaryColor),
    600: Color(0xFF006046),
    700: Color(0xFF00543D),
    800: Color(0xFF004331),
    900: Color(0xFF003628),
  });
  static const int _primaryColor = 0xFF017256;

  static const Color primaryColor = Color(0xFF017256);
  static const Color linkColor = Color(0xFF00BBEF);
  static const Color lightColor = Color(0xFFFBFDFD);
  static const Color darkColor = Color(0xFF1B1B1C);
  static const Color errorColor = Color(0xFFC00505);
  static const Color cardColor = Color(0xE4FFFFFF);
}
